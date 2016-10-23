\version "2.18.2"

\header {
}

global = {
}



ps = \relative c'' {
  \global
   d, e g b c ges' aes bes ees
  
}

words = \lyricmode {
  
  
}

\score {
  <<
  
    \new Staff \ps 
    \omit Score.BarLine
    \omit Score.TimeSignature
    \omit Score.Clef
    
  >>
  \layout { }
  \midi { }
}
