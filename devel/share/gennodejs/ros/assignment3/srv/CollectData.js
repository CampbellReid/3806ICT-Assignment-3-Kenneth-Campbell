// Auto-generated. Do not edit!

// (in-package assignment3.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let SensorData = require('../msg/SensorData.js');

//-----------------------------------------------------------

class CollectDataRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CollectDataRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CollectDataRequest
    let len;
    let data = new CollectDataRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'assignment3/CollectDataRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CollectDataRequest(null);
    return resolved;
    }
};

class CollectDataResponse {
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
    // Serializes a message object of type CollectDataResponse
    // Serialize message field [data]
    bufferOffset = SensorData.serialize(obj.data, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CollectDataResponse
    let len;
    let data = new CollectDataResponse(null);
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
    return 'assignment3/CollectDataResponse';
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
    const resolved = new CollectDataResponse(null);
    if (msg.data !== undefined) {
      resolved.data = SensorData.Resolve(msg.data)
    }
    else {
      resolved.data = new SensorData()
    }

    return resolved;
    }
};

module.exports = {
  Request: CollectDataRequest,
  Response: CollectDataResponse,
  md5sum() { return '0b05c236c4d2e3f6f6d7b02102165372'; },
  datatype() { return 'assignment3/CollectData'; }
};
