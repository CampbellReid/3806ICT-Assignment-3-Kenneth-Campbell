// Auto-generated. Do not edit!

// (in-package assignment3.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Plan = require('../msg/Plan.js');
let State = require('../msg/State.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class ValidatePlanRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.plan = null;
      this.state = null;
    }
    else {
      if (initObj.hasOwnProperty('plan')) {
        this.plan = initObj.plan
      }
      else {
        this.plan = new Plan();
      }
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = new State();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ValidatePlanRequest
    // Serialize message field [plan]
    bufferOffset = Plan.serialize(obj.plan, buffer, bufferOffset);
    // Serialize message field [state]
    bufferOffset = State.serialize(obj.state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ValidatePlanRequest
    let len;
    let data = new ValidatePlanRequest(null);
    // Deserialize message field [plan]
    data.plan = Plan.deserialize(buffer, bufferOffset);
    // Deserialize message field [state]
    data.state = State.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += Plan.getMessageSize(object.plan);
    length += State.getMessageSize(object.state);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment3/ValidatePlanRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a860c6cf0d645e7b67a76e5881e4c512';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Plan plan
    State state
    
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
    
    ================================================================================
    MSG: assignment3/State
    geometry_msgs/Point current_position
    Map environment_map
    
    ================================================================================
    MSG: assignment3/Map
    geometry_msgs/Point[] obstacle_positions
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ValidatePlanRequest(null);
    if (msg.plan !== undefined) {
      resolved.plan = Plan.Resolve(msg.plan)
    }
    else {
      resolved.plan = new Plan()
    }

    if (msg.state !== undefined) {
      resolved.state = State.Resolve(msg.state)
    }
    else {
      resolved.state = new State()
    }

    return resolved;
    }
};

class ValidatePlanResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.valid = null;
    }
    else {
      if (initObj.hasOwnProperty('valid')) {
        this.valid = initObj.valid
      }
      else {
        this.valid = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ValidatePlanResponse
    // Serialize message field [valid]
    bufferOffset = _serializer.bool(obj.valid, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ValidatePlanResponse
    let len;
    let data = new ValidatePlanResponse(null);
    // Deserialize message field [valid]
    data.valid = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment3/ValidatePlanResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a04c5033e7efda95fc3786e8d449c6e7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool valid
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ValidatePlanResponse(null);
    if (msg.valid !== undefined) {
      resolved.valid = msg.valid;
    }
    else {
      resolved.valid = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ValidatePlanRequest,
  Response: ValidatePlanResponse,
  md5sum() { return '3d213886e8ff3dea48868fcfa2e522da'; },
  datatype() { return 'assignment3/ValidatePlan'; }
};
