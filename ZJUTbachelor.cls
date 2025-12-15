% !TEX root = main.tex
\NeedsTeXFormat{LaTeX2e}
%此文档类基于CTeX文档类，作为preamble部分，有以下功能性
%0.香香的A.T力场，对BUG的最强拒绝
%1.导入必要宏包
%2.设置页边距、行距、默认字号、字体
%3.设置页眉页脚
%4.设置目录样式
%5.声明思源黑体字体族（此字体需要安装，免费商用），这是由于\heiti只有一种字重且不想使用伪加粗
%6.设置一级、二级、三级、四级标题的格式、图表标题样式、脚注样式
%7.设置中英文摘要的样式
%8.设置封面样式
%9.设置参考文献格式，采用GBT7714 2005版
\ProvidesClass{ZJUTbachelor}[2025/12/09 2026年计算机学院本科毕业论文Edited by李飞飞 原项目作者@方昊宇https://github.com/AsukaEva2/ZJUTbachelor ]
%默认小四号字体，a4纸张，1.25倍行距（LaTeX中单倍行距为字体的1.2倍，word中单倍行距是字体的1.3倍）因此1.25*1.3/1.2=1.3541667
\LoadClass[zihao=-4,a4paper,linespread=1.3541667,UTF8,fontset=none]{ctexart} 

\RequirePackage{pdfpages} %用于嵌入pdf
\RequirePackage[cal=rsfso]{mathalfa}
\RequirePackage{amsfonts,amssymb,amsmath,amscd,bm} %数学包
\RequirePackage{array} %增强了tabular环境的功能，可以更好的排版表格。
\RequirePackage{enumitem} %增强列表功能
\RequirePackage{zhnumber} %中文数字，其实可以不导入，CTeX已集成可以用\chinese{计数器}实现。
\RequirePackage{datetime}
\RequirePackage{booktabs} %三线表
\RequirePackage{graphicx} %导入图片
\RequirePackage{float} %浮动体位置
\RequirePackage{multirow} %纵向合并表格单元格，不支持换行
\RequirePackage{makecell} %也能纵向合并表单单元格，支持换行
\RequirePackage{listings} %插入代码块
\RequirePackage{extarrows} %为了用长等号

\RequirePackage[version=4]{mhchem} %无机化学公式（显式版本，避免警告）
\RequirePackage{chemfig}
\newcommand*{\newchemfig}[1]{~\chemfig{#1}~}

\RequirePackage{caption} %标题
% 统一图表标题：五号、加粗（中文将使用CJK主字体，英文将使用西文字体Times New Roman）
\DeclareCaptionFont{zjutcaption}{\zihao{5}\bfseries}
\captionsetup{
	font=zjutcaption, 
	justification=centering %多行标题居中
}

%ref,eqref命令没有间距太丑了
\newcommand*{\tabref}[1]{\tablename~\ref{#1}~}
\newcommand*{\figref}[1]{\figurename~\ref{#1}~}
\newcommand*{\neweqref}[1]{公式~\eqref{#1}~}

\RequirePackage{xcolor} % 提供 \set@color 等钩子，避免相关报错
\RequirePackage{hyperref} %超链接
\hypersetup{hidelinks} %不显示颜色框

\RequirePackage{fontspec} %字体设置
\setmainfont{Times New Roman} %西文字体Times New Roman
\setmonofont{Courier New} %等宽字体
% 明确设置中文主字体、无衬线字体、等宽字体，并提供 \songti/\heiti 命令
\setCJKmainfont{Source Han Serif CN}
\setCJKsansfont{Source Han Sans SC}
\setCJKmonofont{Source Han Sans SC} %中文等宽使用思源黑体
\setCJKfamilyfont{songti}{Source Han Serif CN}
\newcommand*{\songti}{\CJKfamily{songti}}
\setCJKfamilyfont{heiti}{Source Han Sans SC}[BoldFont=*-Medium]
\newcommand*{\heiti}{\CJKfamily{heiti}}

\RequirePackage{geometry}  % 页面设置
\geometry{a4paper,left=3.18cm,right=3.18cm,top=2.54cm,bottom=2.54cm} %版面页边距上下2.54cm，左右3.18cm
% 正文首行缩进2个汉字
\setlength{\parindent}{2\ccwd}
% 缓解溢出盒警告与断行优化
\setlength{\emergencystretch}{3em}
\tolerance=5000
\hbadness=5000

\RequirePackage{fancyhdr} %页眉页脚
\pagestyle{fancy} %empty不显示页眉页脚
\fancyhf{}
\fancyhead[C]{\centering\songti\zihao{-5}浙江工业大学本科生毕业论文（设计）} %页眉加"浙江工业大学本科生毕业论文（设计）"，字体为宋体小五号，居中
\fancyfoot[C]{\centering\songti\zihao{-5}\thepage} %页码用宋体小五号字页面底端居中。

\RequirePackage[bottom]{footmisc} %脚注紧贴页脚
\RequirePackage{pifont} %脚注圆圈内数字
\renewcommand\thefootnote{\ding{\numexpr171+\value{footnote}}}

\captionsetup{labelsep=quad} %取消图表冒号


\RequirePackage[titles]{tocloft} %目录设置
\setlength{\cftbeforetoctitleskip}{0ex}\setlength{\cftaftertoctitleskip}{0ex} %"目录"这个标题的前后垂直距离
\setlength{\cftbeforesecskip}{0ex}\setlength{\cftbeforesubsecskip}{0ex}\setlength{\cftbeforesubsubsecskip}{0ex} %section,subsection,subsubsection垂直距离
\cftsetpnumwidth{1em}  %页码离最后一个点的距离
\cftsetindents{section}{0em}{4em} %一级标题：缩进0，编号宽度4em
\cftsetindents{subsection}{2em}{2.5em} %二级标题：缩进2em，编号宽度2.5em  
\cftsetindents{subsubsection}{4.5em}{3em} %三级标题：缩进4.5em，编号宽度3em
\cftsetindents{figure}{0em}{5em}
\cftsetindents{table}{0em}{5em}
\renewcommand{\cftdotsep}{1} %标题和页码中间的点间距
\renewcommand{\cftsecdotsep}{\cftdotsep}
\renewcommand{\cfttabpresnum}{表}
\renewcommand{\cftfigpresnum}{图}
\counterwithin{table}{section}
\counterwithin{figure}{section}
\counterwithin{equation}{section}
\renewcommand{\cftsecpagefont}{\songti\zihao{-4}} %所有页码：宋体小四
\renewcommand{\cftsubsecpagefont}{\songti\zihao{-4}}
\renewcommand{\cftsubsubsecpagefont}{\songti\zihao{-4}}
\renewcommand{\cftfigpagefont}{\songti\zihao{-4}}
\renewcommand{\cfttabpagefont}{\songti\zihao{-4}}
\renewcommand{\cftsecfont}{\songti\zihao{-4}} %所有标题：宋体小四
\renewcommand{\cftsubsecfont}{\songti\zihao{-4}}
\renewcommand{\cftsubsubsecfont}{\songti\zihao{-4}}
\renewcommand{\cftfigfont}{\songti\zihao{-4}}
\renewcommand{\cfttabfont}{\songti\zihao{-4}}
\renewcommand{\cftsubsecleader}{\cftsecleader}
\renewcommand{\cftsubsubsecleader}{\cftsecleader}
\renewcommand{\cfttableader}{\cftsecleader}
\renewcommand{\cftfigleader}{\cftsecleader}


%安装思源黑体（7种字重），声明一个字体族，用\CJKfamily调用更改
\setCJKfamilyfont{siyuanheiti}{Source Han Sans SC}[BoldFont=*-Medium]
\newcommand*{\siyuanheiti}{\CJKfamily{siyuanheiti}}
\newcommand*{\siyuanheitiBold}{\CJKfamily{siyuanheiti}\bfseries}

%章节标题设置：空格写死，这样自动生成目录才能带上空格
\ctexset{
	bibname = {\siyuanheitiBold\zihao{3}参考文献},
	contentsname = {\siyuanheitiBold\zihao{3}目\hspace{2em}录},
	listfigurename = {\siyuanheitiBold\zihao{3}图目录},
	listtablename = {\siyuanheitiBold\zihao{3}表目录},
	figurename = {图},
	tablename = {表},
	section/name = {第,章},
	section/number = \Chinese{section},
	subsection/number = \arabic{section}.\arabic{subsection},
	subsubsection/number = \arabic{section}.\arabic{subsection}.\arabic{subsubsection},
	section/format = \centering\siyuanheiti\zihao{3}\linespread{1.3541667}\selectfont,
	section/beforeskip = 2\baselineskip,
	section/afterskip = 1\baselineskip,
	subsection/format = \raggedright\siyuanheiti\zihao{4}\linespread{1.3541667}\selectfont,
	subsection/beforeskip = 2\baselineskip,
	subsection/afterskip = 1\baselineskip,
	subsubsection/format = \raggedright\siyuanheiti\zihao{-4}\linespread{1.3541667}\selectfont,
	subsubsection/beforeskip = 1\baselineskip,
	subsubsection/afterskip = 1\baselineskip,
	appendix/name={附\hspace{2em}录},
	appendix/number=\arabic{section}
}

% 设置标题编号深度，使 paragraph 和 subparagraph 也能编号
\setcounter{secnumdepth}{5}

% 设置 paragraph 计数器在 subsubsection 下自动编号
\makeatletter
\@addtoreset{paragraph}{subsubsection}
\@addtoreset{subparagraph}{paragraph}
\makeatother

% 四级标题（paragraph）编号格式：⑴⑵⑶… (使用带括号的数字)
% 使用文本模拟带括号的数字：(1)(2)(3)...
\renewcommand{\theparagraph}{(\arabic{paragraph})}

% 五级标题（subparagraph）编号格式：①②③… (使用带圈的数字)  
% Zapf Dingbats 字体中 \ding{192}-\ding{201} 对应 ①-⑩
\renewcommand{\thesubparagraph}{\ding{\the\numexpr191+\value{subparagraph}\relax}}

% 使用titlesec包重新定义paragraph和subparagraph的格式
\RequirePackage{titlesec}
\titleformat{\paragraph}[hang]{\raggedright\songti\zihao{-4}\linespread{1.3541667}\selectfont}{\theparagraph}{0.5em}{}
\titlespacing{\paragraph}{0pt}{0.5\baselineskip}{0.5\baselineskip}

\titleformat{\subparagraph}[hang]{\raggedright\songti\zihao{-4}\linespread{1.3541667}\selectfont}{\thesubparagraph}{0.5em}{}
\titlespacing{\subparagraph}{0pt}{0.5\baselineskip}{0.5\baselineskip}

%摘要的中英文标题切换
\newif\ifAbstractEN
\providecommand\AbstractEN{
	\ifAbstractEN
	\ctexset{abstractname={\mdseries\zihao{-3}ABSTRACT}}
	\else
	\ctexset{abstractname={\siyuanheitiBold\zihao{3}摘\hspace{2em}要}}
	\fi
} 



% 参考文献：使用 GB/T 7714-2005 数字顺序制，引用上角标
\RequirePackage[numbers,2005]{gbt7714}
\AtBeginDocument{\citestyle{super}}

%字号
%初号 \zihao{0}
%小初号 \zihao{-0}
%一号 \zihao{1}
%小一号 \zihao{-1}
%二号 \zihao{2}
%小二号 \zihao{-2}
%三号 \zihao{3}
%小三号 \zihao{-3}
%四号 \zihao{4}
%小四号 \zihao{-4}
%五号 \zihao{5}
%小五号 \zihao{-5}
%六号 \zihao{6}
%小六号 \zihao{-6}
%七号 \zihao{7}
%八号 \zihao{8}

%字体
%宋体 \songti
%黑体 \heiti
%楷体 \kaishu
%微软雅黑 \yahei
%思源黑体 \siyuanheiti
%思源黑体加粗 \siyuanheitiBold

% 定义并保存用户信息（提供 @ 内部存储与公开访问宏，输出时避免使用 @）
\makeatletter
\newcommand\ThesisTitle{}
\newcommand\Supervisor{}
\newcommand\StudentName{}
\newcommand\StudentId{}
\newcommand\Department{}
\newcommand\MajorName{}
\newcommand\ClassName{}
\newcommand\SubmitDate{}
\providecommand\thesis[1]{\def\@thesis{#1}\def\ThesisTitle{#1}}
\providecommand\mysupervisor[1]{\def\@mysupervisor{#1}\def\Supervisor{#1}}
\providecommand\myname[1]{\def\@myname{#1}\def\StudentName{#1}}
\providecommand\studentid[1]{\def\@studentid{#1}\def\StudentId{#1}}
\providecommand\department[1]{\def\@department{#1}\def\Department{#1}}
\providecommand\major[1]{\def\@major{#1}\def\MajorName{#1}}
\providecommand\class[1]{\def\@class{#1}\def\ClassName{#1}}
\providecommand\submitdate[1]{\def\@submitdate{#1}\def\SubmitDate{#1}}
\makeatother

%封面：空2行+logo+空3行+"本科生毕业论文（设计）"(宋体1号加粗)+空1行+题目(标签小二黑体，内容三号黑体)+空3行+学院等(宋体小三加粗，1.25倍行距)
\providecommand{\Cover}{%
	\thispagestyle{empty}%
	{\centering
		\vspace*{1.5\baselineskip}
		\begin{figure}[H]
			\centering
			\includegraphics[width=0.7\linewidth]{pics/logo.png}
		\end{figure}
		\vspace{2\baselineskip}
		\songti\zihao{1}\bfseries 本科生毕业论文（设计）\par
		\vspace{1\baselineskip}
		{\siyuanheitiBold\zihao{-2}题目：}{\siyuanheitiBold\zihao{3}\underline{\makebox[18em][c]{\ThesisTitle}}}\par
		\vspace{2.5\baselineskip}
		\songti\zihao{-3}\bfseries
		\renewcommand{\arraystretch}{1.25}
		\begin{tabular}{@{}ll@{}}
			学\hspace{2em}院： & \underline{\makebox[13em][c]{\Department}} \\
			专\hspace{2em}业： & \underline{\makebox[13em][c]{\MajorName}} \\
			班\hspace{2em}级： & \underline{\makebox[13em][c]{\ClassName}} \\
			学\hspace{2em}号： & \underline{\makebox[13em][c]{\StudentId}} \\
			学生姓名： & \underline{\makebox[13em][c]{\StudentName}} \\
			指导老师： & \underline{\makebox[13em][c]{\Supervisor}} \\
			提交日期： & \underline{\makebox[13em][c]{\SubmitDate}} \\
		\end{tabular}\par
		\newpage
	}%
}


%中文摘要："摘要"二字（三号黑体，字间空2格写死，居中），下空1行，内容小四宋体1.25倍行距每段首行缩进2字符，下空1行，"关键词"（小四黑体加粗）
\providecommand{\ZhAbstract}[2]{	
	\AbstractENfalse\AbstractEN
	\begin{center}\siyuanheitiBold\zihao{3}摘\hspace{2em}要\end{center}
	\vspace{\baselineskip}
	{\songti\zihao{-4}\linespread{1.3541667}\selectfont\setlength{\parindent}{2\ccwd}\par
	#1\par}
	\vspace{\baselineskip}
	\noindent{\siyuanheitiBold\zihao{-4}\bfseries 关键词：}{\songti\zihao{-4}#2}
	\phantomsection
	\addcontentsline{toc}{section}{摘\hspace{2em}要}
	\pagebreak
}


\makeatletter
\newcommand\EnThesisTitle{}
\newcommand\EnStudentName{}
\newcommand\EnSupervisor{}
\newcommand\EnDepartment{}
\providecommand\Enthesis[1]{\def\@Enthesis{#1}\def\EnThesisTitle{#1}}
\providecommand\Enmyname[1]{\def\@Enmyname{#1}\def\EnStudentName{#1}}
\providecommand\Enmysupervisor[1]{\def\@Enmysupervisor{#1}\def\EnSupervisor{#1}}
\providecommand\Endepartment[1]{\def\@Endepartment{#1}\def\EnDepartment{#1}}
\makeatother

%英文摘要：英文标题（三号Times加粗全大写，居中，左右各缩进两格），下空1行，"ABSTRACT"（三号Times加粗，居中），下空1行，内容小四Times 1.25倍行距每段首行缩进二格，下空1行，"KEY WORDS"（小四Times全大写加粗），关键词小写
\providecommand{\EnAbstract}[2]{
	\AbstractENtrue\AbstractEN
	\begin{center}
		\parbox{0.92\linewidth}{\centering\zihao{3}\bfseries\MakeUppercase{\EnThesisTitle}}
	\end{center}
	\vspace{\baselineskip}
	\begin{center}\zihao{3}\bfseries ABSTRACT\end{center}
	\vspace{\baselineskip}
	\zihao{-4}\linespread{1.3541667}\selectfont
	\setlength{\parindent}{2\ccwd}
	#1\par
	\vspace{\baselineskip}
	\noindent{\zihao{-4}\bfseries KEY WORDS: }{\zihao{-4}\MakeLowercase{#2}}
	\phantomsection
	\addcontentsline{toc}{section}{ABSTRACT}	
	\pagebreak
}

%目录、表列、图列
\providecommand{\makeTOCandLOTandLOF}{	
	%1.25倍行距
	{ 
		\pagebreak
		\pagestyle{fancy}
		\linespread{1.3541667}\selectfont
		\songti\zihao{-4}
		\phantomsection
		\addcontentsline{toc}{section}{目\hspace{2em}录}
		\tableofcontents
		
		\pagebreak	
		\phantomsection
		\addcontentsline{toc}{section}{表目录}
		\centering\listoftables
		
		\pagebreak	
		\phantomsection
		\addcontentsline{toc}{section}{图目录}
		\centering\listoffigures
		
		\pagebreak	
	}
	
}


%致谢："致  谢"三号黑体，中间空2字写死，居中，1.25倍行距，段前24磅段后12磅，内容小四号1.25倍行距
\providecommand{\makeAcknowledge}[1]{	
	\clearpage
	\phantomsection
	\addcontentsline{toc}{section}{致\hspace{2em}谢}
	{\centering\siyuanheitiBold\zihao{3}\linespread{1.3541667}\selectfont 致\hspace{2em}谢\par}
	\vspace{12bp}
	\songti\zihao{-4}\linespread{1.3541667}\selectfont
	\setlength{\parindent}{2\ccwd}
	#1
}

%附录："附  录"三号黑体，中间空2字写死，居中，1.25倍行距，段前24磅段后12磅
\providecommand{\makeAppendix}[1]{	
	\clearpage
	\phantomsection
	\addcontentsline{toc}{section}{附\hspace{2em}录}
	{\centering\siyuanheitiBold\zihao{3}\linespread{1.3541667}\selectfont 附\hspace{2em}录\par}
	\vspace{12bp}
	\songti\zihao{-4}\linespread{1.3541667}\selectfont
	\setlength{\parindent}{2\ccwd}
	#1
}

% 章起新页
\pretocmd{\section}{\clearpage}{}{}

% 图表与公式编号样式：按章计数，连字符
\renewcommand\thefigure{\thesection-\arabic{figure}}
\renewcommand\thetable{\thesection-\arabic{table}}
\renewcommand\theequation{\thesection-\arabic{equation}}

% 参考文献环境：内容宋体五号1.25倍行距
\RequirePackage{etoolbox}
\AtBeginEnvironment{thebibliography}{%
  \songti\zihao{5}\linespread{1.3541667}\selectfont
}

