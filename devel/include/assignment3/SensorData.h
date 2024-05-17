// Generated by gencpp from file assignment3/SensorData.msg
// DO NOT EDIT!


#ifndef ASSIGNMENT3_MESSAGE_SENSORDATA_H
#define ASSIGNMENT3_MESSAGE_SENSORDATA_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Point.h>
#include <assignment3/Obstacle.h>

namespace assignment3
{
template <class ContainerAllocator>
struct SensorData_
{
  typedef SensorData_<ContainerAllocator> Type;

  SensorData_()
    : position()
    , speed(0.0)
    , obstacles()  {
    }
  SensorData_(const ContainerAllocator& _alloc)
    : position(_alloc)
    , speed(0.0)
    , obstacles(_alloc)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::Point_<ContainerAllocator>  _position_type;
  _position_type position;

   typedef float _speed_type;
  _speed_type speed;

   typedef std::vector< ::assignment3::Obstacle_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::assignment3::Obstacle_<ContainerAllocator> >> _obstacles_type;
  _obstacles_type obstacles;





  typedef boost::shared_ptr< ::assignment3::SensorData_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::assignment3::SensorData_<ContainerAllocator> const> ConstPtr;

}; // struct SensorData_

typedef ::assignment3::SensorData_<std::allocator<void> > SensorData;

typedef boost::shared_ptr< ::assignment3::SensorData > SensorDataPtr;
typedef boost::shared_ptr< ::assignment3::SensorData const> SensorDataConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::assignment3::SensorData_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::assignment3::SensorData_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::assignment3::SensorData_<ContainerAllocator1> & lhs, const ::assignment3::SensorData_<ContainerAllocator2> & rhs)
{
  return lhs.position == rhs.position &&
    lhs.speed == rhs.speed &&
    lhs.obstacles == rhs.obstacles;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::assignment3::SensorData_<ContainerAllocator1> & lhs, const ::assignment3::SensorData_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace assignment3

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::assignment3::SensorData_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::assignment3::SensorData_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignment3::SensorData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignment3::SensorData_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment3::SensorData_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment3::SensorData_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::assignment3::SensorData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a03770c3aed274e9b2c5466968320a9b";
  }

  static const char* value(const ::assignment3::SensorData_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa03770c3aed274e9ULL;
  static const uint64_t static_value2 = 0xb2c5466968320a9bULL;
};

template<class ContainerAllocator>
struct DataType< ::assignment3::SensorData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "assignment3/SensorData";
  }

  static const char* value(const ::assignment3::SensorData_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::assignment3::SensorData_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Point position\n"
"float32 speed\n"
"Obstacle[] obstacles\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: assignment3/Obstacle\n"
"geometry_msgs/Point position\n"
"float32 size\n"
;
  }

  static const char* value(const ::assignment3::SensorData_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::assignment3::SensorData_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.position);
      stream.next(m.speed);
      stream.next(m.obstacles);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SensorData_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::assignment3::SensorData_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::assignment3::SensorData_<ContainerAllocator>& v)
  {
    s << indent << "position: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.position);
    s << indent << "speed: ";
    Printer<float>::stream(s, indent + "  ", v.speed);
    s << indent << "obstacles[]" << std::endl;
    for (size_t i = 0; i < v.obstacles.size(); ++i)
    {
      s << indent << "  obstacles[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::assignment3::Obstacle_<ContainerAllocator> >::stream(s, indent + "    ", v.obstacles[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ASSIGNMENT3_MESSAGE_SENSORDATA_H
