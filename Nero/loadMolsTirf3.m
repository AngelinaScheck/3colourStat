%Angelina Scheck September 2016 (based on loadMols: Loading molecules from
%tirf3analysis output data
% Extract data from (possibly changed) input data to individual molecule data

function newMols = loadMolsTirf3(in, currentMols)
    % Initiate variables
    numberOfFiles = length(in);
    numberOfMolecules = 0;
    newMols = currentMols;
   
    % Check all files in input data
    for (currentFile = 1:numberOfFiles)        
        allMolData = in{currentFile}.data;
        molsInFile = length(allMolData);
        numberOfMolecules = numberOfMolecules + molsInFile;
        if (numberOfMolecules > length(newMols)) % If these molecules are new
            for (i = 1:molsInFile)
                % Extract molecule data from MovieResults object
%                 DD=
%                 TT=
%                 AA=
%                 DT=
%                 DA=
%                 TA=
%                 
%                 EDT= %efficiency donor to transfer
%                 EDA= %efficiency donor to acceptor
%                 ETA= %efficiency transfer to acceptor
%                 
%                 SDT= %stochiometry donor to transfer
%                 SDA= %stochiometry donor to acceptor
%                 STA= %stochiometry transfer to acceptor
                
                
                % Save molecule data
                currentMol = length(newMols) + 1;
                newMols{currentMol} = struct;                
                newMols{currentMol}.DD = DD;
                newMols{currentMol}.DA = DA;
                newMols{currentMol}.AA = AA;
                newMols{currentMol}.E = E;
                newMols{currentMol}.S = S;
                
                %AS: for plotting molecule-images: Edit later
%                 newMols{currentMol}.posDD = data.aDetData.aDetPos(1,:);
%                 newMols{currentMol}.posAA = data.aDetData.aDetPos(2,:); 
%                 newMols{currentMol}.posDA = data.aDetData.aDetPos(3,:);                
%                 
                newMols{currentMol}.include = false;
                newMols{currentMol}.min = 1;
                newMols{currentMol}.max = min(length(EDA), length(EDA),length(EDA));
                newMols{currentMol}.file = currentFile;
            end
        end
    end
end


end

