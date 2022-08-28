classdef ProjectIntegrityTests < matlab.unittest.TestCase

    methods(Test)

        function testMainFoldersExistence(testCase)
            foldersList = {'data'; 'documents'; 'models'; 'resources'; ...
                'scripts'; 'tests'; 'utilities'; 'work'};

            existenceExpected = true(length(foldersList),1);

            existenceActual = cellfun(@(x) exist(x,'dir') == 7, foldersList);

            testCase.verifyEqual(existenceActual,existenceExpected);
        end

        function testSubfoldersExistence(testCase)
            foldersList = {'dictionaries'; 'experiments'; 'simulation'; ...
                'reports'; 'requirements'; 'cache'; 'codegen'};


            existenceExpected = true(length(foldersList),1);

            existenceActual = cellfun(@(x) exist(x,'dir') == 7, foldersList);

            testCase.verifyEqual(existenceActual,existenceExpected);
        end

        function testModelFolderContent(testCase)
            folderContentList = dir(fullfile('models', '*.*'));

            necessaryContent = cell(1,length(folderContentList)-2);

            for i = 3:length(folderContentList)
                necessaryContent{i-2} = folderContentList(i).name;
            end
            
            contentActual = all(cellfun(@(x) contains(x,'.slx'), necessaryContent));

            testCase.verifyEqual(contentActual,true);
        end

        function testDictionariesFolderContent(testCase)
            folderContentList = dir(fullfile('dictionaries', '*.*'));

            necessaryContent = cell(1,length(folderContentList)-2);

            for i = 3:length(folderContentList)
                necessaryContent{i-2} = folderContentList(i).name;
            end
            
            contentActual = all(cellfun(@(x) contains(x,'.sldd'), necessaryContent));

            testCase.verifyEqual(contentActual,true);
        end
    end

end