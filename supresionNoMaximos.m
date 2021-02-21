function maximos = supresionNoMaximos(Mag, Orientacion)
    [N,M] = size(Orientacion);
    
    maximos = zeros(N,M);
    
    for i = 2:N-1
        for j = 2:M-1
            if Orientacion(i,j) == 0
                if Mag(i,j) == max([Mag(i,j) Mag(i,j+1) Mag(i,j-1)])
                    maximos(i,j) = Mag(i,j);
                end
            elseif Orientacion(i,j) == 45
                if Mag(i,j) == max([Mag(i,j) Mag(i+1,j-1) Mag(i-1,j+1)])
                    maximos(i,j) = Mag(i,j);
                end
            elseif Orientacion(i,j) == 90
                if Mag(i,j) == max([Mag(i,j) Mag(i+1,j) Mag(i-1,j)])
                    maximos(i,j) = Mag(i,j);
                end
            elseif Orientacion(i,j) == 135
                if Mag(i,j) == max([Mag(i,j) Mag(i-1,j-1) Mag(i+1,j+1)])
                    maximos(i,j) = Mag(i,j);
                end
            end     
        end
    end 