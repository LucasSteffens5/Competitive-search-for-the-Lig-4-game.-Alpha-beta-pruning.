

function [ best_val, best_pos,alpha,beta ] = minimax_alpha_beta( Board, depth, player, alpha, beta )
%     Minimax helper function: Return the minimax value of a particular board,
%     given a particular depth to estimate to

%    Basicamente guardar o estado anterior e vereficar se existe um melhor.
     
    debug = 0;

    
    best_val = nan; % Melhor valor 
    best_pos = 0;   %Melhor posicao
    val = -Inf;     % Valores de Alfa e beta começam no Infinito 
    
    if is_terminal(Board, depth),  % Se eh um estado terminal 
        best_val =  eval_game(Board, depth, player);  % Melhor valor recebe a pontuacao dada pela heuristica
    else % Se nao eh um estado terminal
        
           
        for i=1:7,  % De 1 ate 7 faÃ§a
            
            
            [new_board, valid] = do_move( Board, i, player);% gera um novo tabuleiro, e retorna um valor que indica a validade do tabuleiro;
            
            if valid == 1, % Se o tabuleiro for valido
                
                val = max (val,-1*minimax_alpha_beta(new_board, depth-1, opposite_player(player),-beta,-alpha)); % Chama minimax para MIN apenas multiplicando por -1 e invertendo o sinal de beta e alpha
                %val recebe o bestvalue retornado por MIN e no caso
                %contratio por max
                if(val>=beta),
                     best_val = val;
                    best_pos = i;
                    
                    i=8;
                    
                
                else
                    if isnan(best_val) || val > best_val,
                    best_val = val;
                    best_pos = i;
                    end
                 alpha= max(alpha,val);
                  setGlobalx(getGlobal+1); % contador 
                end
                
        
              end        
            end
              
        end
         
    
    
    if debug == 1,
        fprintf('******************************************\n');
        fprintf('Profundidade: %d\nJogador: %d\nMelhor valor: %f\nMelhor Posicao: %f\n Contador: %d\n', depth, player, best_val, best_pos,cont);

   

       fprintf('******************************************\n');
    end

end

