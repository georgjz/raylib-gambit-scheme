;;;;;; Helper functions for the Vector3 struct of raylib 

(c-declare #<<c-declare-end

#include "raylib.h"

Vector3 make_vector_3( float x, float y, float z )
{
    return (Vector3){ x, y, z };
}

// This function takes the Scheme object and turns it into a Vector3 
___SCMOBJ SCMOBJ_to_VECTOR3( ___PSD ___SCMOBJ src, Vector3 *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ car   = ___CAR( src );
      ___SCMOBJ cadr  = ___CADR( src );
      ___SCMOBJ caddr = ___CADDR( src );
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( car, dst->x, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( cadr, dst->y, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( caddr, dst->z, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( caddr, dst->z, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( cadr, dst->y, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( car, dst->x, arg_num )
    }
  return ___err;
}

// This function takes a Vector3 and turns it into a Scheme object
___SCMOBJ VECTOR3_to_SCMOBJ( ___processor_state ___ps, Vector3 src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ x_scmobj;
  ___SCMOBJ y_scmobj;
  ___SCMOBJ z_scmobj;
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.x, x_scmobj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.y, y_scmobj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.z, z_scmobj, arg_num )
  y_scmobj = ___EXT( ___make_pair ) ( ___ps, y_scmobj, z_scmobj );
  *dst = ___EXT( ___make_pair ) ( ___ps, x_scmobj, y_scmobj );
  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.z, z_scmobj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.y, y_scmobj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.x, x_scmobj, arg_num )
  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_VECTOR3(src,dst,i) \
if ((___err = SCMOBJ_to_VECTOR3 (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_VECTOR3(src,dst,i) }

#define ___BEGIN_CFUN_VECTOR3_to_SCMOBJ(src,dst) \
if ((___err = VECTOR3_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_VECTOR3_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_VECTOR3_to_SCMOBJ(src,dst,i) \
if ((___err = VECTOR3_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_VECTOR3_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_VECTOR3(src,dst) \
{ ___err = SCMOBJ_to_VECTOR3 (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_VECTOR3(src,dst) }

c-declare-end
)

(c-define-type vector3 "Vector3" "VECTOR3_to_SCMOBJ" "SCMOBJ_to_VECTOR3" #f)

(define make-vector3 
  (lambda (x y z)
    (let ((vec (c-lambda (float float float) vector3 "make_vector_3")))
      (flatten (vec x y z)))))
