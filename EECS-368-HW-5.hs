primes :: [Integer]

primes = sieve [2..]

  where

    sieve (p:xs) = p : sieve [x|x <- xs, x `mod` p > 0]

hamming :: [Integer]
hamming = divisible[1..]
  where
    divisible (h:hs) = h : divisible [h|h <- hs, (h `mod` 3 == 0 || h `mod` 5 == 0 || h `mod` 7 == 0)] 
main = do

  print(primes !! 999)
  print(hamming !! 2)