;;;;;; Helper functions for the Camera3D struct of raylib 

(c-declare #<<c-declare-end

#include "raylib.h"

Camera3D make_vector_3( Vector3 pos, Vector3 target, Vector3 up, float fovy, int type )
{
    return (Camera3D){ pos, target, up, fovy, type };
}

// This function takes the Scheme object and turns it into a Vector3 
___SCMOBJ SCMOBJ_to_CAMERA3D( ___PSD ___SCMOBJ src, Camera3D *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ position   = ___CAR( src );
      ___SCMOBJ target     = ___CADR( src );
      ___SCMOBJ up         = ___CADDR( src );
      ___SCMOBJ fovy       = ___CADDDR( src );
      ___SCMOBJ type       = ___CAR(___CDDDDR( src ));
      ___BEGIN_CFUN_SCMOBJ_TO_VECTOR3( position, dst->position, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_VECTOR3( target, dst->target, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_VECTOR3( up, dst->up, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( fovy, dst->fovy, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_INT( type, dst->type, arg_num )
      // Clean up
      ___END_CFUN_SCMOBJ_TO_INT( type, dst->type, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( fovy, dst->fovy, arg_num )
      ___END_CFUN_SCMOBJ_TO_VECTOR3( up, dst->up, arg_num )
      ___END_CFUN_SCMOBJ_TO_VECTOR3( target, dst->target, arg_num )
      ___END_CFUN_SCMOBJ_TO_VECTOR3( position, dst->position, arg_num )
    }
  return ___err;
}

// This function takes a Vector3 and turns it into a Scheme object
___SCMOBJ CAMERA3D_to_SCMOBJ( ___processor_state ___ps, Camera3D src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  // struct data
  ___SCMOBJ camera3d_position_scmobj;
  ___SCMOBJ camera3d_target_scmobj;
  ___SCMOBJ camera3d_up_scmobj;
  ___SCMOBJ camera3d_fovy_scmobj;
  ___SCMOBJ camera3d_type_scmobj;
 // get struct data 
  ___BEGIN_SFUN_VECTOR3_TO_SCMOBJ( src.position, camera3d_position_scmobj, arg_num )
  ___BEGIN_SFUN_VECTOR3_TO_SCMOBJ( src.target, camera3d_target_scmobj, arg_num )
  ___BEGIN_SFUN_VECTOR3_TO_SCMOBJ( src.up, camera3d_up_scmobj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.fovy, camera3d_fovy_scmobj, arg_num )
  ___BEGIN_SFUN_INT_TO_SCMOBJ( src.type, camera3d_type_scmobj, arg_num )
  // cons all data into a list to return to Scheme 
  camera3d_type_scmobj    = ___EXT( ___make_pair ) ( ___ps, camera3d_type_scmobj, camera3d_type_scmobj );
  camera3d_fovy_scmobj    = ___EXT( ___make_pair ) ( ___ps, camera3d_fovy_scmobj, camera3d_type_scmobj );
  camera3d_up_scmobj      = ___EXT( ___make_pair ) ( ___ps, camera3d_up_scmobj, camera3d_fovy_scmobj );
  camera3d_target_scmobj  = ___EXT( ___make_pair ) ( ___ps, camera3d_target_scmobj, camera3d_up_scmobj );
  *dst                    = ___EXT( ___make_pair ) ( ___ps, camera3d_position_scmobj, camera3d_target_scmobj );
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

(c-define-type camera-3d "Camera3D" "CAMERA3D_to_SCMOBJ" "SCMOBJ_to_CAMERA3D" #f)

(define make-vector3 
  (lambda (x y z) 'implement-me))
    ; (let ((vec (c-lambda (float float float) vector3 "make_vector_3")))
      ; (flatten (vec x y z)))))
