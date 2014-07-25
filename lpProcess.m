function map = lpProcess( cellString )
%LPPROCESS Summary of this function goes here
%   next output (f,A,b,Aeq,beq,lb,ub);

map = cell(length(cellString),6);
map(:,1) = cellString;
    
   for index = 1:length(cellString)
      
       line = cellString{index};
      
       %Check if the line is a comment
       comment = regexp(line,'^%');
       %Check if is the goal
       goal = regexpi(line,'(max|min)');
       %Check if there are double inequalities
       inequalities = regexp(line,'<=?|>=?');
       %Check if there is an ecuation
       equation = regexp(line,'=');
       
       if(length(comment) > 0)
           map{index,2} = 'comment';
         
       elseif(length(goal) > 0)              
            map{index,2} = 'goal';  
            [map{index,3},map{index,4}] = terms(line);

            
           
       elseif(length(inequalities) > 2)              
            map{index,2} = 'failure'; 
            fprintf('There is more than one inequality on line %d',index);
       
       elseif(length(inequalities) == 2)              
            map{index,2} = 'doubleInequalities';
            fprintf('There is more than one inequality on line %d',index)
            %TODO split in two different equialities
            
       elseif(length(inequalities) == 1) 
            sign = regexp(line,'<=?|>=?','match');
            map{index,2} = 'inequality';
            [map{index,3},map{index,4}] = terms(line(1:inequalities));
            [map{index,5},map{index,6}] = terms(line(inequalities+1:end));
      
       elseif(length(equation) > 1)              
            map{index,2} = 'failure'; 
            fprintf('There is more than one equation on line %d',index);
       
       elseif(length(equation) == 1)              
            map{index,2} = 'equation';
            [map{index,3},map{index,4}] = terms(line(1:equation));
            [map{index,5},map{index,6}] = terms(line(equation+1:end));   
       else               
           map{index,2} = 'unknown';
           
       end
   end
   
   
   %Fin all distinct variables
       
 


end

function   [var,const] = terms(side)
%This is code without equality or inequality simbols to return variable
%names an coeffiecients
       terms = regexp(side,'+|-','split');
       sign =  regexp(side,'+|-','match');

       var = cell(1,length(terms));
       const = ones(1,length(terms));
       
       
       for index =1:length(terms)
           
           var{:,index} = regexp(terms{index},'\<([a-z]|[A-Z])\w*','match');
           constants = regexp(terms{index},'\<[0-9.,]+','match');
           
           for subIndex =1:length(constants)
                const(subIndex) = str2double(constants{1,subIndex});
           end
           if(index > 1)
                if(sign{index-1} == '-')
                    const(index) = -1 * const(index); 
                end
           end
           
       end
  
end

function [A,b] = processEquation ( equation , varList)
%All the sign must be ==
%syms should be execute only one before calling this function

    eval('syms x v n k;[A,b] = equationsToMatrix(k * 5 + 10 == 2,x,v,k)')
    
end

