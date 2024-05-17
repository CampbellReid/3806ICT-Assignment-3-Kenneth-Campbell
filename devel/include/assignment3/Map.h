// Generated by gencpp from file assignment3/Map.msg
// DO NOT EDIT!


#ifndef ASSIGNMENT3_MESSAGE_MAP_H
#define ASSIGNMENT3_MESSAGE_MAP_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Point.h>

namespace assignment3
{
template <class ContainerAllocator>
struct Map_
{
  typedef Map_<ContainerAllocator> Type;

  Map_()
    : obstacle_positions()  {
    }
  Map_(const ContainerAllocator& _alloc)
    : obstacle_positions(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::geometry_msgs::Point_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::geometry_msgs::Point_<ContainerAllocator> >> _obstacle_positions_type;
  _obstacle_positions_type obstacle_positions;





  typedef boost::shared_ptr< ::assignment3::Map_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::assignment3::Map_<ContainerAllocator> const> ConstPtr;

}; // struct Map_

typedef ::assignment3::Map_<std::allocator<void> > Map;

typedef boost::shared_ptr< ::assignment3::Map > MapPtr;
typedef boost::shared_ptr< ::assignment3::Map const> MapConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::assignment3::Map_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::assignment3::Map_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::assignment3::Map_<ContainerAllocator1> & lhs, const ::assignment3::Map_<ContainerAllocator2> & rhs)
{
  return lhs.obstacle_positions == rhs.obstacle_positions;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::assignment3::Map_<ContainerAllocator1> & lhs, const ::assignment3::Map_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace assignment3

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::assignment3::Map_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::assignment3::Map_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignment3::Map_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::assignment3::Map_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment3::Map_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::assignment3::Map_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::assignment3::Map_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e5fca51cc9da81dd3cbc4f12a389770c";
  }

  static const char* value(const ::assignment3::Map_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe5fca51cc9da81ddULL;
  static const uint64_t static_value2 = 0x3cbc4f12a389770cULL;
};

template<class ContainerAllocator>
struct DataType< ::assignment3::Map_<ContainerAllocator> >
{
  static const char* value()
  {
    return "assignment3/Map";
  }

  static const char* value(const ::assignment3::Map_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::assignment3::Map_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Point[] obstacle_positions\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::assignment3::Map_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::assignment3::Map_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.obstacle_positions);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Map_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::assignment3::Map_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::assignment3::Map_<ContainerAllocator>& v)
  {
    s << indent << "obstacle_positions[]" << std::endl;
    for (size_t i = 0; i < v.obstacle_positions.size(); ++i)
    {
      s << indent << "  obstacle_positions[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "    ", v.obstacle_positions[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ASSIGNMENT3_MESSAGE_MAP_H
