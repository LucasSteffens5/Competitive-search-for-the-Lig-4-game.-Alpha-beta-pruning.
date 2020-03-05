% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Função Octave/MATLAB que implementa 
%
% author: raonifst at gmail dot com


function [ score ] = eval_game( Board, depth,  player)
       % score pertence ao intervalo [2,4,6] dei essas notas aleatoriamente
       % Profundidade???
  
  
  
     score =  find_streak(Board,  player, 2)* 10; 
      
      score = score+ find_streak(Board,  player, 3)* 100;
        
      score = score+ find_streak(Board,  player, 4)* 1000; 
     
     
     % OPPOSITE PLAYER
     
      score = score- find_streak(Board,  opposite_player(player), 2)* 10; 
      
      score = score - find_streak(Board,  opposite_player(player), 3)* 100;
        
      score = score - find_streak(Board,  opposite_player(player), 4)* 1000; 
     
        
   
    
    
    
    
    
    
    
    
   
       
end

