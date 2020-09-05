;;;;;; Helper functions for the Vector2 struct of raylib 

(c-declare #<<c-declare-end

#include "raylib.h"

Vector2 make_vector_2( float x, float y )
{
    // TODO: implement me
    return (Vector2){ 0.0f, 0.0f }
}

// This function takes the Scheme object and turns it into a Vector2 
___SCMOBJ SCMOBJ_to_VECTOR2( ___PSD ___SCMOBJ src, point *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ car  = ___CAR( src );
      ___SCMOBJ cadr = ___CADR( src );
      ___BEGIN_CFUN_SCMOBJ_TO_INT( car, dst->x, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( cadr, dst->y, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( cadr, dst->y, arg_num )
      ___END_CFUN_SCMOBJ_TO_INT( car, dst->x, arg_num )
    }
  return ___err;
}

// This function takes a Vector2 and turns it into a Scheme object
___SCMOBJ POINT_to_SCMOBJ( ___processor_state ___ps, point src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ x_scmobj;
  ___SCMOBJ y_scmobj;
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.x, x_scmobj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.y, y_scmobj, arg_num )
  *dst = ___EXT( ___make_pair ) ( ___ps, x_scmobj, y_scmobj );
  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */
  ___END_SFUN_INT_TO_SCMOBJ( src.y, y_scmobj, arg_num )
  ___END_SFUN_INT_TO_SCMOBJ( src.x, x_scmobj, arg_num )
  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_VECTOR2( src, dst, i ) \
    if( ( ___err = SCMOBJ_to_POINT( ___PSP src, &dst, i ) ) == ___FIX( ___NO_ERR ) ) 
    {
        #define ___END_CFUN_SCMOBJ_to_POINT( src, dst, i ) 
    }

#define ___BEGIN_CFUN_VECTOR2_to_SCMOBJ( src, dst ) \
    if ((___err = POINT_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) 
    {
        #define ___END_CFUN_POINT_to_SCMOBJ( src, dst ) \
            ___EXT( ___release_scmobj ) ( dst ); 
    }

#define ___BEGIN_SFUN_POINT_to_SCMOBJ(src,dst,i) \
if ((___err = POINT_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_POINT_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_POINT(src,dst) \
{ ___err = SCMOBJ_to_POINT (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_POINT(src,dst) }

c-declare-end
)

