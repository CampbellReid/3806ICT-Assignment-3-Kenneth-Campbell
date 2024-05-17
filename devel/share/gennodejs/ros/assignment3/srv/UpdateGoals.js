// Auto-generated. Do not edit!

// (in-package assignment3.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Feedback = require('../msg/Feedback.js');

//-----------------------------------------------------------

let Goals = require('../msg/Goals.js');

//-----------------------------------------------------------

class UpdateGoalsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.feedback = null;
    }
    else {
      if (initObj.hasOwnProperty('feedback')) {
        this.feedback = initObj.feedback
      }
      else {
        this.feedback = new Feedback();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type UpdateGoalsRequest
    // Serialize message field [feedback]
    bufferOffset = Feedback.serialize(obj.feedback, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type UpdateGoalsRequest
    let len;
    let data = new UpdateGoalsRequest(null);
    // Deserialize message field [feedback]
    data.feedback = Feedback.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment3/UpdateGoalsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5a18a644baec791a43483fe444dc46d5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Feedback feedback
    
    ================================================================================
    MSG: assignment3/Feedback
    bool action_success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new UpdateGoalsRequest(null);
    if (msg.feedback !== undefined) {
      resolved.feedback = Feedback.Resolve(msg.feedback)
    }
    else {
      resolved.feedback = new Feedback()
    }

    return resolved;
    }
};

class UpdateGoalsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.goals = null;
    }
    else {
      if (initObj.hasOwnProperty('goals')) {
        this.goals = initObj.goals
      }
      else {
        this.goals = new Goals();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type UpdateGoalsResponse
    // Serialize message field [goals]
    bufferOffset = Goals.serialize(obj.goals, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type UpdateGoalsResponse
    let len;
    let data = new UpdateGoalsResponse(null);
    // Deserialize message field [goals]
    data.goals = Goals.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Goals.getMessageSize(object.goals);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment3/UpdateGoalsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c98f3dbea20dbea9abe774fb6d094aa4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Goals goals
    
    
    ================================================================================
    MSG: assignment3/Goals
    Goal[] primary_goals
    Goal[] secondary_goals
    
    ================================================================================
    MSG: assignment3/Goal
    string description
    int32 priority
    geometry_msgs/Point[] waypoints
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new UpdateGoalsResponse(null);
    if (msg.goals !== undefined) {
      resolved.goals = Goals.Resolve(msg.goals)
    }
    else {
      resolved.goals = new Goals()
    }

    return resolved;
    }
};

module.exports = {
  Request: UpdateGoalsRequest,
  Response: UpdateGoalsResponse,
  md5sum() { return 'efc5b6996c038d80435f5da349a26d95'; },
  datatype() { return 'assignment3/UpdateGoals'; }
};
