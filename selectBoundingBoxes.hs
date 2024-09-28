filterBoxes :: Float -> [( (Float, Float, Float, Float), Float)] -> [(Float, Float, Float, Float)] 
filterBoxes limiar pairs = [boundingBox | (boundingBox, score) <- pairs, score >= limiar]


selectBoundingBoxesWithHighScore :: [(Float,Float,Float,Float)] -> [Float] -> Float -> [(Float, Float, Float, Float)]
selectBoundingBoxesWithHighScore boundingBoxes scores limiar = 
    filterBoxes limiar (zip boundingBoxes scores)
