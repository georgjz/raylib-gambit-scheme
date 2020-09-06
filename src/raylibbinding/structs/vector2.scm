;;;;;; Helper functions for the Vector2 struct of raylib 

(c-declare #<<c-declare-end

#include "raylib.h"

Vector2 make_vector_2( float x, float y )
{
    return (Vector2){ x, y };
}

// This function takes the Scheme object and turns it into a Vector2 
___SCMOBJ SCMOBJ_to_VECTOR2( ___PSD ___SCMOBJ src, Vector2 *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  if ( !___PAIRP( src ) )
    ___err = ___FIX( ___UNKNOWN_ERR );
  else
    {
      ___SCMOBJ car  = ___CAR( src );
      ___SCMOBJ cadr = ___CADR( src );
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( car, dst->x, arg_num )
      ___BEGIN_CFUN_SCMOBJ_TO_FLOAT( cadr, dst->y, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( cadr, dst->y, arg_num )
      ___END_CFUN_SCMOBJ_TO_FLOAT( car, dst->x, arg_num )
    }
  return ___err;
}

// This function takes a Vector2 and turns it into a Scheme object
___SCMOBJ VECTOR2_to_SCMOBJ( ___processor_state ___ps, Vector2 src, ___SCMOBJ *dst, int arg_num )
{
  ___SCMOBJ ___err = ___FIX( ___NO_ERR );
  ___SCMOBJ x_scmobj;
  ___SCMOBJ y_scmobj;
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.x, x_scmobj, arg_num )
  ___BEGIN_SFUN_FLOAT_TO_SCMOBJ( src.y, y_scmobj, arg_num )
  *dst = ___EXT( ___make_pair ) ( ___ps, x_scmobj, y_scmobj );
  if ( ___FIXNUMP( *dst ) )
    ___err = *dst; /* return allocation error */
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.y, y_scmobj, arg_num )
  ___END_SFUN_FLOAT_TO_SCMOBJ( src.x, x_scmobj, arg_num )
  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_VECTOR2(src,dst,i) \
if ((___err = SCMOBJ_to_VECTOR2 (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_VECTOR2(src,dst,i) }

#define ___BEGIN_CFUN_VECTOR2_to_SCMOBJ(src,dst) \
if ((___err = VECTOR2_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_VECTOR2_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_VECTOR2_to_SCMOBJ(src,dst,i) \
if ((___err = VECTOR2_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_VECTOR2_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_VECTOR2(src,dst) \
{ ___err = SCMOBJ_to_VECTOR2 (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_VECTOR2(src,dst) }


c-declare-end
)

(c-define-type vector2 "Vector2" "VECTOR2_to_SCMOBJ" "SCMOBJ_to_VECTOR2" #f)

(define make-vector2 
  (lambda (x y)
    (let ((vec (c-lambda (float float) vector2 "make_vector_2")))
      (flatten (vec x y)))))

(define flatten 
  (lambda (ls)
    (cond 
      ((null? ls) '())
      ((pair? ls) (append (flatten (car ls))
                          (flatten (cdr ls))))
      (else (list ls)))))

(define add-vector 
  (lambda (a b)
    (cond 
      ((null? a) '())
      (else (cons (+ (car a) (car b))
                  (add-vector (cdr a) (cdr b)))))))