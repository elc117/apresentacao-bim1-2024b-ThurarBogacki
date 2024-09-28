# Atividade 3
# Select Bounding Boxes With High Score 

Crie uma função para obter as bounding boxes com scores maiores que um dado valor. Essa função deve receber a lista de bounding boxes, a lista de classes e o valor do limiar.
Resolva esta função sem usar lambda, só usando outras funções existentes ou que você declarar. Pesquise a função zip, que será útil aqui.


RESOLUÇÃO:

```
filterBoxes :: Float -> [( (Float, Float, Float, Float), Float)] -> [(Float, Float, Float, Float)] 
filterBoxes limiar pairs = [boundingBox | (boundingBox, score) <- pairs, score >= limiar]


selectBoundingBoxesWithHighScore :: [(Float,Float,Float,Float)] -> [Float] -> Float -> [(Float, Float, Float, Float)]
selectBoundingBoxesWithHighScore boundingBoxes scores limiar = 
    filterBoxes limiar (zip boundingBoxes scores)


 ```

#**Passo a Passo**

1° Definimos a função **filterBoxes** que recebe como parâmetro a váriavel **Limiar**, o zip **filteredPairs** e nos retorna uma tupla de boundingBoxes  
 ```filterBoxes :: [( (Float, Float, Float, Float), Float)] -> [   (Float, Float, Float, Float)]```  

 2° Passamos que a função **filterBoxes** irá receber um argumento **Limiar** e um **pairs**  
```[boundingBox | (boundingBox, score <- pairs ```  
Definimos a condição de filtragem dos elementos:  
```score >= limiar```  
Essa condição irá incluir um **boundingBox** na nova lista caso **score** >= **limiar**

3° Declaramos a função chamando de **selectBoundingBoxesWithHighScore**;  
```selectBoundingBoxesWithHighScore```

4° Passamos como primeiro argumento da função uma tupla [(float,float,float,float)] **boundingBoxes**, o que significa que teremos uma tupla de elementos com 4 valores cada;  
```selectBoundingBoxesWithHighScore :: [(Float,Float,Float,Float)]```

- Ex: [(300,100,0,1),(100,500,1,30)] #Dois elementos com 4 valores em cada;

5° Passamos como segundo argumento da função uma tupla [float] **scores**, para definir as pontuações de cada Bounding Box;  
```selectBoundingBoxesWithHighScore :: [(Float,Float,Float,Float)] -> [Float]```

6° Passamos um valor float **Limiar** ao qual iremos usar para extrair somente as BoundignBox->Score > limiar  
```selectBoundingBoxesWithHighScore :: [(Float,Float,Float,Float)] -> [Float] -> Float```

7° Chamamos a função FilterBoxes e passamos para ela o valor **Limiar** juntamento com uma tupla que contém cada boundingBox atribuida com o seu Score  
```filterBoxes limiar (zip boundingBoxes scores)```

#**Conclusão**

Com isso, resolvemos a probelmática passada pela atividade #3 onde filtramos de uma tupla de BoundignBox apenas os elementos cujo score >= limiar


#**Na Prática**

Compilando esse código Haskell em um terminal **ghci** com as seguintes entradas:  
```selectBoundingBoxesWithHighScore [(0,0,1,1),(2,3,1,2),(10,300,500,1)] [0.5, 0.8, 0.9] 0.8 ```  
Temos como retorno do script:  
```[(2.0,3.0,1.0,2.0),(10.0,300.0,500.0,1.0)]```  
De fato, o código nos retorna somente os valores de BoundignBox onde score >= limiar


#**Versão Errônea**  

    selectBoundingBoxesWithHighScore :: [(Float,Float,Float,Float)] -> [Float] -> Float -> [(Float, Float, Float, Float)]

    selectBoundingBoxesWithHighScore boundingBoxes scores limiar  = 

    filterBoxes filteredPairs
    where 
    filteredPairs = zip boundingBoxes scores
    
    filterBoxes :: [( (Float, Float, Float, Float), Float)] -> [   (Float, Float, Float, Float)]
    filterBoxes pairs = [boundingBox | (boundingBox, score) <- pairs, score >= limiar]```  

- Essa versão apresenta uma maneira equivocada de definir o tipo primitivo **Float** != **float**
    - Em haskell, **Float** é reconhecido como um tipo primitivo de números em ponto flutuante, enquanto **float** (minusculo) não é reconhecido como tipo primitivo;
    - Você pode definir novos tipos primitivos em Haskell 
        - Ex:   
        ``` data Placar = Placar int int```  
        ```p1 :: Placar```  
        ```p1 = Placar 1 2```


#**Fontes**  
[Pdf](https://www.facom.ufu.br/~madriana/PF/TP3-Listas.pdf) (para entender a função zip);  
[Playlist YouTube](https://www.youtube.com/watch?v=rrBMYho3frs&list=PLYItvall0TqLlCPN9vbDIc8FAKhG-RfbM) (Usada para aprender sintaxe e propriedades da linguagem Haskell);  
[Fiel Escudeiro](https://chatgpt.com/) ( ChatGPT Usado para tirar dúvidas específicas e erros no processo de compilação);