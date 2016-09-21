% Angelina Scheck September 2016: Load tirf3Output and add them to input
% data (based on loadData)
%tirf3analysis putput data is a matlab object, so information can be
%extracted directly
function newInput = loadDataTirf3(currentInput, filename, pathname)   
    % Create new files cell 
    newFiles = cell(size(filename));  
    % Initiate waitbar
    wb = waitbar(0,'Loading data files...');
    for (i = 1:length(filename))
        % Load file
        path = [pathname filename{i}];        
        outputObject = load(path);
        
        % Add file to new files cell
        newFiles{i} = struct;
        newFiles{i}.filePath = path;
        %AS: deal with images later
        %newFiles{i}.images = outputObject.movieResult;
%         newFiles{i}.data = outputObject.twotoneData.results.data;
%         for (j = 1:length(newFiles{i}.data)) 
%             newFiles{i}.data(j).fitParam = [];
%         end
        % Update waitbar
        waitbar(i/length(filename),wb);          
    end 
    % Close waitbar
    close(wb);    
       
    % Add new input data to existing data
    newInput = currentInput;
    newInput((end + 1):(end + length(newFiles))) = newFiles; % Notice () parenthesis!!!
end

