\version "2.18.2"
#(set! paper-alist (cons '("my size" . (cons (* 2.5 in) (* 9.0 in))) paper-alist))

\paper {
  #(set-paper-size "my size")
5


\header {
    tagline = ""  % removed 
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
