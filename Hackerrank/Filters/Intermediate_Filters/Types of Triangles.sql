select
    case
        when A + B <= C OR A+C<=B OR B+C<=A then "Not A Triangle"
        when A = B and B = C then "Equilateral"
        when A = B or B = C or C = A then "Isosceles"
        else 'Scalene'
END as triangletype
from Triangles
