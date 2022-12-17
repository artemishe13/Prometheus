#Sudoku Solver
#https://www.codewars.com/kata/5296bc77afba8baa690002d7
#Write a function that will solve a 9x9 Sudoku puzzle. 
#The function will take one argument consisting of the 2D puzzle array, 
#with the value 0 representing an unknown square.
#The Sudokus tested against your function will be "easy" (i.e. determinable; 
#there will be no need to assume and test possibilities on unknowns) and can be solved with a brute-force approach.

def arrVert (arr, vert)
    #Выделяем вертикальный столбец в массив
    newArr=[]
arr.each {|arrI|
    arrI.size.times {|i|  i == vert ?  newArr << arrI[i] : i }
}
    newArr
end

def arrAbsent (arr)
    #Создает массив с отсутствующими элементами исходя из шаблона
    arrSB = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    arr.size.times{|i| arrSB.delete(arr[i]) if arrSB.include? arr[i] }
    arrSB
end

def nineX3 (arr)
    #Пересборка массива 9х9 => 3x3*3
    arrX = []
    y=0
    0.upto(2){
    arrT1, arrT2, arrT3 = [], [], []
        0.upto(2){|i|
            0.upto(2){|ii| arrT1 << arr[i+y][ii]}
            3.upto(5){|ii| arrT2 << arr[i+y][ii]}
            6.upto(8){|ii| arrT3 << arr[i+y][ii]}
        }
        arrX << arrT1
        arrX << arrT2
        arrX << arrT3
        y +=3
    }
    arrX
end

def arrKor (arr, i, ii, number)
    arr[i][ii]=number
    # Пересборка всех контрольных массивов после внесений изменений в базовый
    arrVerAbs, arrGorAbs, arrX = [], [], []
    #Формируем массив всех недостающих значений по горизонтали
    arr.each {|arrI| arrGorAbs << arrAbsent(arrI)}
    #Формируем массив всех недостающих значений по вертикали
    0.upto(8) {|i| arrVerAbs << arrAbsent(arrVert(arr, i))}
    arrX3 = nineX3(arr)
    return arr, arrVerAbs, arrGorAbs, arrX3
end

def arrZero (arr)
    zero = 0
    arr.size.times{|i| zero += 1 if arr[i] == 0 }
    zero
end

def arrIndex (arr, arrI)
    #Выборка из массива по шаблону индексов
    arrIn = []
    arrI.each{|i| arr.size.times{|ii| arrIn <<  arr[ii]  if ii == i}}
    arrIn
end

def arrPoisk (arr)
    arrVerAbs, arrGorAbs, arrX = [], [], []
    #Формируем массив всех недостающих значений по горизонтали
    arr.each {|arrI| arrGorAbs << arrAbsent(arrI) }
    #Формируем массив всех недостающих значений по вертикали
    0.upto(8) {|i| arrVerAbs << arrAbsent(arrVert(arr, i)) }
    arrX3 = nineX3(arr) 
#Сравниваем массивы недостающих элементов по всему массиву
0.upto(8) {|i|
0.upto(8) {|ii|
    if arr[i][ii] == 0
    #Создаем вертикальную маску для контроля значений в столбце
    tempArr = arrVert(arr, ii)
    hh = {}
    tempArr.size.times {|j|
        if tempArr[j] == 0
            arrGorAbs[i].size.times {|iii|
                if arrGorAbs[j].include? arrGorAbs[i][iii]
                    hh[arrGorAbs[i][iii]]==nil ? hh[arrGorAbs[i][iii]] = 1 : hh[arrGorAbs[i][iii]] = hh.values_at(arrGorAbs[i][iii])<<1
                elsif tempArr.include? arrGorAbs[i][iii] 
                    hh[arrGorAbs[i][iii]]==nil ? hh[arrGorAbs[i][iii]] = 1 : hh[arrGorAbs[i][iii]] = hh.values_at(arrGorAbs[i][iii])<<1
                end
            }
        end
    }
        arrH = []
        hh.to_a.each {|arrI| 
        arrI.flatten[1] == 1 && arrI.flatten.size == 2 ? arrH << arrI.flatten : arrI
        }
        arrH.flatten!
        if arrH.size == 2 
                arr[i][ii]=arrH[0]
                # Пересборка всех контрольных массивов после внесений изменений в базовый
                arrVerAbs, arrGorAbs, arrX = [], [], []
                #Формируем массив всех недостающих значений по горизонтали
                arr.each {|arrI| arrGorAbs << arrAbsent(arrI)}
                #Формируем массив всех недостающих значений по вертикали
                0.upto(8) {|i| arrVerAbs << arrAbsent(arrVert(arr, i))}
                arrX3 = nineX3(arr)
                i, ii = 0, 0
        end
    end
#############################
# Пересборка всех контрольных массивов после внесений изменений в базовый
arrVerAbs, arrGorAbs, arrX = [], [], []
#Формируем массив всех недостающих значений по горизонтали
arr.each {|arrI| arrGorAbs << arrAbsent(arrI) }
#Формируем массив всех недостающих значений по вертикали
0.upto(8) {|i| arrVerAbs << arrAbsent(arrVert(arr, i)) }
#Массив квадратов 3х3
arrX3 = nineX3(arr)
    }
}
# Определение квадрата 3х3
arrX9 = [[[0, 1, 2], [0, 1, 2]],
         [[0, 1, 2], [3, 4, 5]],
         [[0, 1, 2], [6, 7, 8]],
         [[3, 4, 5], [0, 1, 2]],
         [[3, 4, 5], [3, 4, 5]],
         [[3, 4, 5], [6, 7, 8]],
         [[6, 7, 8], [0, 1, 2]],
         [[6, 7, 8], [3, 4, 5]],
         [[6, 7, 8], [6, 7, 8]]]
arrPr = arr
#Сравниваем массивы недостающих элементов по квадратам 3х3
0.upto(8){|k|
#print "arrAbsent(arrX3[k]) ", arrAbsent(arrX3[k]), "\n"
    x = arrX9[k][0]
    y = arrX9[k][1]
    x.each{|xx| 
    y.each{|yy| 
        if arr[xx][yy] == 0
            arr[xx][yy] = arrGorAbs[xx]+arrVerAbs[yy]
            #Отсекаем дубли
            my_hash = {}
            arr[xx][yy].each {|h| my_hash[h] = []}
            arr[xx][yy] = my_hash.to_a.flatten
            #print "Проверяем на то что уже есть", "\n"
            arr[xx].each{|arrI| arr[xx][yy].delete(arrI) if arr[xx][yy].include? arrI}
            arrVert(arr, yy).each{|arrI| arr[xx][yy].delete(arrI) if arr[xx][yy].include? arrI}
            arrX3[k].each{|arrI| arr[xx][yy].delete(arrI) if arr[xx][yy].include? arrI}
        end
        } 
    }
}
0.upto(8) {|i|
0.upto(8) {|ii|
arr[i][ii] = 0 if arr[i][ii].size > 1 if arr[i][ii].class == Array
    }
    arr[i].flatten!
}
    arr
end

def sudoku(puzzle)
    puzzle.each {|arrI|
    arrPoisk(puzzle) if puzzle.flatten.include? 0
    }
    puzzle
end

puzzle = [[5,3,0,0,7,0,0,0,0],
          [6,0,0,1,9,5,0,0,0],
          [0,9,8,0,0,0,0,6,0],
          [8,0,0,0,6,0,0,0,3],
          [4,0,0,8,0,3,0,0,1],
          [7,0,0,0,2,0,0,0,6],
          [0,6,0,0,0,0,2,8,0],
          [0,0,0,4,1,9,0,0,5],
          [0,0,0,0,8,0,0,7,9]]

should = [  [5,3,4,6,7,8,9,1,2],
            [6,7,2,1,9,5,3,4,8],
            [1,9,8,3,4,2,5,6,7],
            [8,5,9,7,6,1,4,2,3],
            [4,2,6,8,5,3,7,9,1],
            [7,1,3,9,2,4,8,5,6],
            [9,6,1,5,3,7,2,8,4],
            [2,8,7,4,1,9,6,3,5],
            [3,4,5,2,8,6,1,7,9]]

          puzzle2 = [
            [5, 6, 0, 8, 4, 7, 0, 0, 0], 
            [3, 0, 9, 0, 0, 0, 6, 0, 0], 
            [0, 0, 8, 0, 0, 0, 0, 0, 0], 
            [0, 1, 0, 0, 8, 0, 0, 4, 0], 
            [7, 9, 0, 6, 0, 2, 0, 1, 8], 
            [0, 5, 0, 0, 3, 0, 0, 9, 0], 
            [0, 0, 0, 0, 0, 0, 2, 0, 0], 
            [0, 0, 6, 0, 0, 0, 8, 0, 7], 
            [0, 0, 0, 3, 1, 6, 0, 5, 9]]
          
          solution2 = [
            [5, 6, 1, 8, 4, 7, 9, 2, 3], 
            [3, 7, 9, 5, 2, 1, 6, 8, 4], 
            [4, 2, 8, 9, 6, 3, 1, 7, 5], 
            [6, 1, 3, 7, 8, 9, 5, 4, 2], 
            [7, 9, 4, 6, 5, 2, 3, 1, 8], 
            [8, 5, 2, 1, 3, 4, 7, 9, 6], 
            [9, 3, 5, 4, 7, 8, 2, 6, 1], 
            [1, 4, 6, 2, 9, 5, 8, 3, 7], 
            [2, 8, 7, 3, 1, 6, 4, 5, 9]]
            
          puzzle3 = [
            [8, 0, 0, 0, 6, 0, 0, 0, 3], 
            [4, 0, 0, 8, 0, 3, 0, 0, 1], 
            [7, 0, 0, 0, 2, 0, 0, 0, 6], 
            [0, 6, 0, 0, 0, 0, 2, 8, 0], 
            [0, 0, 0, 4, 1, 9, 0, 0, 5], 
            [0, 0, 0, 0, 8, 0, 0, 7, 9], 
            [5, 3, 0, 0, 7, 0, 0, 0, 0], 
            [6, 0, 0, 1, 9, 5, 0, 0, 0], 
            [0, 9, 8, 0, 0, 0, 0, 6, 0]] 
            
          solution3 = [
            [8, 5, 9, 7, 6, 1, 4, 2, 3], 
            [4, 2, 6, 8, 5, 3, 7, 9, 1], 
            [7, 1, 3, 9, 2, 4, 8, 5, 6], 
            [9, 6, 1, 5, 3, 7, 2, 8, 4], 
            [2, 8, 7, 4, 1, 9, 6, 3, 5], 
            [3, 4, 5, 2, 8, 6, 1, 7, 9], 
            [5, 3, 4, 6, 7, 8, 9, 1, 2], 
            [6, 7, 2, 1, 9, 5, 3, 4, 8], 
            [1, 9, 8, 3, 4, 2, 5, 6, 7]]

            puzzle4=[[8,0,0,0,0,0,0,0,0],
                    [0,0,3,6,0,0,0,0,0],
                    [0,7,0,0,9,0,2,0,0],
                    [0,5,0,0,0,7,0,0,0],
                    [0,0,0,0,4,5,7,0,0],
                    [0,0,0,1,0,0,0,3,0],
                    [0,0,1,0,0,0,0,6,8],
                    [0,0,8,5,0,0,0,1,0],
                    [0,9,0,0,0,0,4,0,0]]

    solution4 =[[8,1,2,7,5,3,6,4,9],
                [9,4,3,6,8,2,1,7,5],
                [6,7,5,4,9,1,2,8,3],
                [1,5,4,2,3,7,8,9,6],
                [3,6,9,8,4,5,7,2,1],
                [2,8,7,1,6,9,5,3,4],
                [5,2,1,9,7,4,3,6,8],
                [4,3,8,5,2,6,9,1,7],
                [7,9,6,3,1,8,4,5,2]]

arr = sudoku(puzzle4)
arr.each{|arrI| print arrI, "\n"}






