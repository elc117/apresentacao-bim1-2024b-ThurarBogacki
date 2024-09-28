selectBoundingBoxesWithHighScore :: [(Float,Float,Float,Float)] -> [Float] -> Float -> [(Float, Float, Float, Float)]

selectBoundingBoxesWithHighScore boundingBoxes scores limiar  = 

    filterBoxes filteredPairs
    where 
    filteredPairs = zip boundingBoxes scores
    
    filterBoxes :: [( (Float, Float, Float, Float), Float)] -> [(Float, Float, Float, Float)]
    filterBoxes pairs = [boundingBox | (boundingBox, score) <- pairs, score >= limiar]