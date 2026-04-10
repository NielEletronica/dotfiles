const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0E0F11", /* black   */
  [1] = "#515452", /* red     */
  [2] = "#5F615E", /* green   */
  [3] = "#6C6E6B", /* yellow  */
  [4] = "#7E817E", /* blue    */
  [5] = "#0B5AA1", /* magenta */
  [6] = "#51738A", /* cyan    */
  [7] = "#85bbd7", /* white   */

  /* 8 bright colors */
  [8]  = "#5d8296",  /* black   */
  [9]  = "#515452",  /* red     */
  [10] = "#5F615E", /* green   */
  [11] = "#6C6E6B", /* yellow  */
  [12] = "#7E817E", /* blue    */
  [13] = "#0B5AA1", /* magenta */
  [14] = "#51738A", /* cyan    */
  [15] = "#85bbd7", /* white   */

  /* special colors */
  [256] = "#0E0F11", /* background */
  [257] = "#85bbd7", /* foreground */
  [258] = "#85bbd7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
