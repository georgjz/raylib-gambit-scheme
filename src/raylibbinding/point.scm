(c-declare #<<c-declare-end

typedef struct { int x, y; } point;

// void line_to (point p) { ... }
// point get_mouse (void) { ... }
point add_points (point p1, point p2) 
{ 
    int new_x = p1.x + p2.x;
    int new_y = p1.y + p2.y;
    point new_point = (point){ new_x, new_y };
    return new_point;
}

point get_a_point()
{
    int new_x = 1;
    int new_y = 2;
    point new_point = (point){ new_x, new_y };
    return new_point;
}

point make_point( int x, int y )
{
    return (point){ x, y };
}

___SCMOBJ SCMOBJ_to_POINT (___PSD ___SCMOBJ src, point *dst, int arg_num)
{
  ___SCMOBJ ___err = ___FIX(___NO_ERR);
  if (!___PAIRP(src))
    ___err = ___FIX(___UNKNOWN_ERR);
  else
    {
      ___SCMOBJ car = ___CAR(src);
      ___SCMOBJ cdr = ___CDR(src);
      ___BEGIN_CFUN_SCMOBJ_TO_INT(car,dst->x,arg_num)
      ___BEGIN_CFUN_SCMOBJ_TO_INT(cdr,dst->y,arg_num)
      ___END_CFUN_SCMOBJ_TO_INT(cdr,dst->y,arg_num)
      ___END_CFUN_SCMOBJ_TO_INT(car,dst->x,arg_num)
    }
  return ___err;
}

___SCMOBJ POINT_to_SCMOBJ (___processor_state ___ps, point src, ___SCMOBJ *dst, int arg_num)
{
  ___SCMOBJ ___err = ___FIX(___NO_ERR);
  ___SCMOBJ x_scmobj;
  ___SCMOBJ y_scmobj;
  ___BEGIN_SFUN_INT_TO_SCMOBJ(src.x,x_scmobj,arg_num)
  ___BEGIN_SFUN_INT_TO_SCMOBJ(src.y,y_scmobj,arg_num)
  *dst = ___EXT(___make_pair) (___ps, x_scmobj, y_scmobj);
  if (___FIXNUMP(*dst))
    ___err = *dst; /* return allocation error */
  ___END_SFUN_INT_TO_SCMOBJ(src.y,y_scmobj,arg_num)
  ___END_SFUN_INT_TO_SCMOBJ(src.x,x_scmobj,arg_num)
  return ___err;
}

#define ___BEGIN_CFUN_SCMOBJ_to_POINT(src,dst,i) \
if ((___err = SCMOBJ_to_POINT (___PSP src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_SCMOBJ_to_POINT(src,dst,i) }

#define ___BEGIN_CFUN_POINT_to_SCMOBJ(src,dst) \
if ((___err = POINT_to_SCMOBJ (___ps, src, &dst, ___RETURN_POS)) == ___FIX(___NO_ERR)) {
#define ___END_CFUN_POINT_to_SCMOBJ(src,dst) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_POINT_to_SCMOBJ(src,dst,i) \
if ((___err = POINT_to_SCMOBJ (___ps, src, &dst, i)) == ___FIX(___NO_ERR)) {
#define ___END_SFUN_POINT_to_SCMOBJ(src,dst,i) \
___EXT(___release_scmobj) (dst); }

#define ___BEGIN_SFUN_SCMOBJ_to_POINT(src,dst) \
{ ___err = SCMOBJ_to_POINT (___PSP src, &dst, ___RETURN_POS);
#define ___END_SFUN_SCMOBJ_to_POINT(src,dst) }

c-declare-end
)

(c-define-type point "point" "POINT_to_SCMOBJ" "SCMOBJ_to_POINT" #f)

; (define line-to (c-lambda (point) void "line_to"))
; (define get-mouse (c-lambda () point "get_mouse"))
(define add-points (c-lambda (point point) point "add_points"))
(define make-point (c-lambda (int int) point "make_point"))
(define get-a-point 
  (c-lambda ()
    point "get_a_point"))

(write (get-a-point))
(newline)
(write (add-points (get-a-point) (get-a-point)))