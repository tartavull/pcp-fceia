function matrizPrecedencias = tablaToMatriz( tablaPrecedencias )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
 
   nActivities = length(tablaPrecedencias);
    
   matrizPrecedencias = zeros(nActivities);
   
   for index= 1:nActivities      
       
       precedents = tablaPrecedencias{index,2};
       for precedentsIndex = 1:2:length(precedents)
           
           indexPre = [tablaPrecedencias{:,1}] == precedents(precedentsIndex);
           matrizPrecedencias(index,indexPre)=1; 
           
       end
   end
   
    bg = biograph(matrizPrecedencias,[tablaPrecedencias{:,1}]);
    view(bg);
end



