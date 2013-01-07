function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
%CVec = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
%SVec = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
%bestC = 1;
%bestSigma = 0.3;
%bestError = 99999999;
%errorMat = zeros(length(CVec),length(SVec));

%for cIndx = 1:length(CVec)
%	for sIndx = 1: length(SVec);
%		C = CVec(cIndx);
%		model = svmTrain(X,y,C,@(x1,x2) gaussianKernel(x1,x2,sigma));
%		pred = svmPredict(model, Xval);
%		error = mean(double(pred ~= yval));
%		errorMat(cIndx, sIndx) = error;
%		if(error < bestError)
%			bestC = C;
%			bestSigma = sigma;
%			bestError = error;
%		end
%	end
%end

%C = bestC;
%sigma = bestSigma;
values = [0.01 0.03 0.1 0.3 1 3 10 30]';

% all predictions (in a matrix)
predictions = zeros(size(values));

for i=1:size(values,1), %C
	for j=1:size(values,1), %sigma

		model = svmTrain(X, y, values(i), @(x1, x2) gaussianKernel(x1, x2, values(j))); 
		predict = svmPredict(model,Xval);
		predictions(i,j) = mean(double(predict ~= yval));

	end;		
end;

[colmin, rowindex] = min(predictions);
[minerror, index] = min(colmin);

C = values(rowindex(index));
sigma = values(index);






% =========================================================================

end