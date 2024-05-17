// Auto-generated. Do not edit!

// (in-package assignment3.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let State = require('../msg/State.js');
let Goals = require('../msg/Goals.js');

//-----------------------------------------------------------

let Plan = require('../msg/Plan.js');

//-----------------------------------------------------------

class CreatePlanRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.state = null;
      this.goals = null;
    }
    else {
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = new State();
      }
      if (initObj.hasOwnProperty('goals')) {
        this.goals = initObj.goals
      }
      else {
        this.goals = new Goals();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CreatePlanRequest
    // Serialize message field [state]
    bufferOffset = State.serialize(obj.state, buffer, bufferOffset);
    // Serialize message field [goals]
    bufferOffset = Goals.serialize(obj.goals, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CreatePlanRequest
    let len;
    let data = new CreatePlanRequest(null);
    // Deserialize message field [state]
    data.state = State.deserialize(buffer, bufferOffset);
    // Deserialize message field [goals]
    data.goals = Goals.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += State.getMessageSize(object.state);
    length += Goals.getMessageSize(object.goals);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment3/CreatePlanRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '26f4b76bd097e1b1edcbe52b3102526a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    State state
    Goals goals
    
    ================================================================================
    MSG: assignment3/State
    geometry_msgs/Point current_position
    Map environment_map
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: assignment3/Map
    geometry_msgs/Point[] obstacle_positions
    
    ================================================================================
    MSG: assignment3/Goals
    Goal[] primary_goals
    Goal[] secondary_goals
    
    ================================================================================
    MSG: assignment3/Goal
    string description
    int32 priority
    geometry_msgs/Point[] waypoints
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CreatePlanRequest(null);
    if (msg.state !== undefined) {
      resolved.state = State.Resolve(msg.state)
    }
    else {
      resolved.state = new State()
    }

    if (msg.goals !== undefined) {
      resolved.goals = Goals.Resolve(msg.goals)
    }
    else {
      resolved.goals = new Goals()
    }

    return resolved;
    }
};

class CreatePlanResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.plan = null;
    }
    else {
      if (initObj.hasOwnProperty('plan')) {
        this.plan = initObj.plan
      }
      else {
        this.plan = new Plan();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CreatePlanResponse
    // Serialize message field [plan]
    bufferOffset = Plan.serialize(obj.plan, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CreatePlanResponse
    let len;
    let data = new CreatePlanResponse(null);
    // Deserialize message field [plan]
    data.plan = Plan.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Plan.getMessageSize(object.plan);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment3/CreatePlanResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b47c1e2e43b70f5255aaf39cf4bfdf46';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Plan plan
    
    
    ================================================================================
    MSG: assignment3/Plan
    Waypoint[] waypoints
    
    ================================================================================
    MSG: assignment3/Waypoint
    geometry_msgs/Point position
    
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
    const resolved = new CreatePlanResponse(null);
    if (msg.plan !== undefined) {
      resolved.plan = Plan.Resolve(msg.plan)
    }
    else {
      resolved.plan = new Plan()
    }

    return resolved;
    }
};

module.exports = {
  Request: CreatePlanRequest,
  Response: CreatePlanResponse,
  md5sum() { return 'f5bba44cc5e16145329a21e1c3c0c658'; },
  datatype() { return 'assignment3/CreatePlan'; }
};
