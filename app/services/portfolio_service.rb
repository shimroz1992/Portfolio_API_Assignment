# frozen_string_literal: true

# Serializer for Portfolio model
class PortfolioService
  def self.index
    Portfolio.includes(stocks: :trades).all
  end

  def self.show(params)
    Portfolio.includes(:trades, :stocks).find_by(id: params[:id])
  end

  def self.holdings(params)
    portfolio = find_portfolio(params[:id])
    return { error: 'Portfolio not found' } unless portfolio

    stocks = portfolio.stocks.uniq
    return { error: 'No stocks found for this portfolio' } unless stocks.present?

    calculate_holdings(portfolio, stocks)
  end

  def self.calculate_holdings(portfolio, stocks)
    stocks.map do |stock|
      stock_trades = portfolio.trades.where(stock_id: stock.id)
      buy_trades = stock_trades.where(trade_type: 'buy')

      next if buy_trades.empty?

      stock_count = calculate_avg_holding(stock_trades)
      average_price = buy_trades.pluck(:price).sum / buy_trades.count

      { stock_name: stock.name, stock_count:, average_price: }
    end.compact
  end

  def self.calculate_avg_holding(trades)
    trades.sum { |trade| trade.trade_type == 'buy' ? trade.stock_count : -trade.stock_count }
  end

  def self.returns(params)
    portfolio = find_portfolio(params[:id])
    return { error: 'Portfolio not found' } unless portfolio

    cumulative_returns = calculate_cumulative_returns(portfolio.trades)
    { success: true, data: { cumulative_returns: } }
  end

  # rubocop:disable  Metrics/MethodLength
  def self.calculate_cumulative_returns(trades)
    cumulative_returns = 0.0
    total_investment = 0.0
    trades&.each do |trade|
      if trade.trade_type == 'buy'
        total_investment += trade.price
      elsif trade.trade_type == 'sell'
        returns_cal = trade.price - total_investment
        cumulative_returns += (returns_cal / total_investment) * 100 if total_investment != 0
        total_investment = 0.0
      end
    end
    cumulative_returns
  end
  # rubocop:enable  Metrics/MethodLength

  def self.find_portfolio(id)
    Portfolio.includes(:trades).find_by(id:)
  end
end
