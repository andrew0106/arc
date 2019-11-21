#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);
    
    
    beginAngle=180;
    endAngle=180;
    
    
//    rad=(numsOfCurve*2-1)*  19;       // big arc's radius
//    gapSize=rad/(numsOfCurve*2-1);    // circles size
//    gap=rad-gapSize;   // second arcs pos
//    arcCirRad=ofGetWidth()/2-rad+gapSize/2;  // the buttom circle size
    
    rad=30;       // big arc's radius
    gapSize=10;    // circles size
    gap=rad-gapSize;   // second arcs pos
    arcCirRad=ofGetWidth()/2-rad+gapSize/2;
    
    
    numsOfCurve=10;
    curveStep=gapSize*2;
    maxRad=numsOfCurve*curveStep;
    
    index=0;
    phase=180;
    

    
    

}

//--------------------------------------------------------------
void ofApp::update(){
    
    phase+=0.6;
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    for(int i=0;i<maxRad;i+=curveStep){
        arcsCurve(rad+i);
    }

    ofSetColor(255);
    ofDrawCircle(ofGetWidth()/2, ofGetHeight()-100,gapSize/2);
// }
}

//--------------------------------------------------------------
void ofApp::arcsCurve(int rad){
    ofPath curve;
    
    // point p might be the arc rotate form what radius
    ofPoint p(ofGetWidth()/2, ofGetHeight()-100);
    
    
    
//    ofRotateXDeg(phase);
    float s = abs(sin(ofDegToRad(phase)));
    endAngle = ofMap(s,0,1,181,350);
    
    ofPushMatrix();
    // middle point, radX,radY,angleBegin,angleEnd
    curve.arc(p, rad, rad, beginAngle,endAngle);
    curve.arcNegative(p, gap, gap, endAngle,beginAngle);
    
//    curve.setStrokeWidth(40)

    // to close the path
    curve.close();
    
    
    curve.setArcResolution(60);
    ofColor c(255);

    curve.setColor(c);
    curve.setFilled(true);
    curve.draw();
    curve.newSubPath();
    // the buttom circle
    ofSetColor(c);
    ofDrawCircle(arcCirRad, ofGetHeight()-100,gapSize/2);
    
    ofPopMatrix();
    
    
    //the circle runs with the arc
    
    ofPushMatrix();
    float j=0-rad+gapSize/2;
    ofTranslate(ofGetWidth() / 2, ofGetHeight()-100);
    float g = abs(sin(ofDegToRad(phase)));
    float cirAngle = ofMap(s,0,1,0,170);
    ofRotateDeg(cirAngle);
    ofSetColor(c);
    ofDrawCircle(j,0,gapSize/2);
    ofPopMatrix();
    
}
