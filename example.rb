def find_largest_square_size(samples)
  n = samples.size
  dp = Array.new(n) { Array.new(n, 0) }
  max_square_size = 0

  (0...n).each do |i|
    (0...n).each do |j|
      if samples[i][j] == 1
        if i == 0 || j == 0
          dp[i][j] = 1
        else
          dp[i][j] = [dp[i-1][j], dp[i][j-1], dp[i-1][j-1]].min + 1
        end
        max_square_size = [max_square_size, dp[i][j]].max
      end
    end
  end

  max_square_size
end

binding.irb