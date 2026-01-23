\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{xarticle}[2022/08/27 Extended article]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[a4paper,12pt]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[ngerman]{babel}
\RequirePackage[margin=2cm]{geometry}
\RequirePackage[all=normal,indent,sections,title,lists]{savetrees}
\RequirePackage{url}

\linespread{1.1}

% vim: ft=tex:
