// Auto-generated. Do not edit!

// (in-package assignment3.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let SensorData = require('../msg/SensorData.js');

//-----------------------------------------------------------

let State = require('../msg/State.js');

//-----------------------------------------------------------

class ProcessSensorDataRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.data = null;
    }
    else {
      if (initObj.hasOwnProperty('data')) {
        this.data = initObj.data
      }
      else {
        this.data = new SensorData();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ProcessSensorDataRequest
    // Serialize message field [data]
    bufferOffset = SensorData.serialize(obj.data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ProcessSensorDataRequest
    let len;
    let data = new ProcessSensorDataRequest(null);
    // Deserialize message field [data]
    data.data = SensorData.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += SensorData.getMessageSize(object.data);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment3/ProcessSensorDataRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0b05c236c4d2e3f6f6d7b02102165372';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    SensorData data
    
    ================================================================================
    MSG: assignment3/SensorData
    geometry_msgs/Point position
    float32 speed
    Obstacle[] obstacles
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: assignment3/Obstacle
    geometry_msgs/Point position
    float32 size
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ProcessSensorDataRequest(null);
    if (msg.data !== undefined) {
      resolved.data = SensorData.Resolve(msg.data)
    }
    else {
      resolved.data = new SensorData()
    }

    return resolved;
    }
};

class ProcessSensorDataResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.state = null;
    }
    else {
      if (initObj.hasOwnProperty('state')) {
        this.state = initObj.state
      }
      else {
        this.state = new State();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ProcessSensorDataResponse
    // Serialize message field [state]
    bufferOffset = State.serialize(obj.state, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ProcessSensorDataResponse
    let len;
    let data = new ProcessSensorDataResponse(null);
    // Deserialize message field [state]
    data.state = State.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += State.getMessageSize(object.state);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment3/ProcessSensorDataResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd35b1d9d2b5ea96b7efa33218831c8f0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    State state
    
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ProcessSensorDataResponse(null);
    if (msg.state !== undefined) {
      resolved.state = State.Resolve(msg.state)
    }
    else {
      resolved.state = new State()
    }

    return resolved;
    }
};

module.exports = {
  Request: ProcessSensorDataRequest,
  Response: ProcessSensorDataResponse,
  md5sum() { return 'c62a3bb50e5a12b840b3112c4065ba79'; },
  datatype() { return 'assignment3/ProcessSensorData'; }
};
