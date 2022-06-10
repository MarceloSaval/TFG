function [puntosfaciales]=facerecognitionTFG(imagen)
I=imagen;
[imgFace, LeftEye, RightEye, Mouth, LeftEyebrow,  RightEyebrow] = detectFacialRegions(I);
%% landmark detection

% landmark setting to Eyes and Mouth (4 and 5)
landconf = 5;

% landmarks seting Eyebrows (only 2)
landconfEyebrow = 2;

% left eye landmarks 
imgLeftEye = (imgFace(LeftEye(1,2):LeftEye(1,2)+LeftEye(1,4),LeftEye(1,1):LeftEye(1,1)+LeftEye(1,3),:));
[landLeftEye, leftEyeCont] = eyesProcessing(imgLeftEye,landconf);

% right eye landmarks 
imgRightEye = (imgFace(RightEye(1,2):RightEye(1,2)+RightEye(1,4),RightEye(1,1):RightEye(1,1)+RightEye(1,3),:));
[landRightEye, rightEyeCont] = eyesProcessing(imgRightEye,landconf);

% mouth landmarks 
imgMouth = (imgFace(Mouth(1,2):Mouth(1,2)+Mouth(1,4),Mouth(1,1):Mouth(1,1)+Mouth(1,3),:));
[landMouth, MouthCont] = mouthProcessing(imgMouth,landconf);

% left eyebrow landmarks 
imgLeftEyebrow = (imgFace(LeftEyebrow(1,2):LeftEyebrow(1,2)+LeftEyebrow(1,4),LeftEyebrow(1,1):LeftEyebrow(1,1)+LeftEyebrow(1,3),:));
[landLeftEyebrow, leftEyebrowCont] = eyebrowsProcessing(imgLeftEyebrow,landconfEyebrow);

% right eyebrow landmarks 
imgRightEyebrow = (imgFace(RightEyebrow(1,2):RightEyebrow(1,2)+RightEyebrow(1,4),RightEyebrow(1,1):RightEyebrow(1,1)+RightEyebrow(1,3),:));
[landRightEyebrow, RightEyebrowCont] = eyebrowsProcessing(imgRightEyebrow,landconfEyebrow);

%% shows (eyes, mouth and eyebrows)

% % imshow(imgFace,'InitialMagnification',50); hold on;
% % showsLandmarks(landLeftEye,leftEyeCont,LeftEye,landconf);
% % showsLandmarks(landRightEye,rightEyeCont,RightEye,landconf);
% % showsLandmarks(landMouth,MouthCont,Mouth,landconf);
% % showsLandmarks(landLeftEyebrow,leftEyebrowCont,LeftEyebrow,landconfEyebrow);
% % showsLandmarks(landRightEyebrow,RightEyebrowCont,RightEyebrow,landconfEyebrow);

%% returns the coordinates of the landmarks (eyes, mouth and eyebrows)
coordLeftEye = landmarks(landLeftEye,leftEyeCont,LeftEye,landconf);
coordRightEye = landmarks(landRightEye,rightEyeCont,RightEye,landconf);
coordMouth = landmarks(landMouth,MouthCont,Mouth,landconf);
coordLeftEyebrow = landmarks(landLeftEyebrow,leftEyebrowCont,LeftEyebrow,landconfEyebrow);
coordRightEyebrow = landmarks(landRightEyebrow,RightEyebrowCont,RightEyebrow,landconfEyebrow);
%% return
puntosfaciales=[coordLeftEye,coordLeftEyebrow,coordMouth,coordRightEye,coordRightEyebrow];


end
