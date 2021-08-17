Return-Path: <SRS0=sDSD=NI=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/GXKRjmyDStCzT5+wHrKDVEQWo/VMkmigrGHXdOQztc=;
        b=GyVQZwGZZenLiRUig0bL2EPiugzM8m7+yGMiP9eyAPyS8vCPeGQBOg5IekH4KY9Ig9
         pSBP+jMuHUD894d3LKDKhJvx6GXrhDvG5f+w3agzlkSEHKFm8yUfYjkbindjztdn4cnh
         cir4UsJwdueJg/Ny2x6xHQwHHCKy4GRgxZ6mBxEF6gAZCOJ4fXwthtULY0tIiF4cJuUc
         xfLWOqi29EYcUB5xtuNqLJv0AvGMP8UnEZAmkCauWjc3VPszjC7o+syR8Gm0x916c1ix
         YbgkZPooY99CXb0Bg6FkhavfwYLiOFQct1bZo4F5BlHhlsVy8zo0W3MZoBUV9/IOGuZO
         QqCg==
Subject: Re: [PATCH -perfbook 04/11] Add \ignorespaces command to \IfEbookSize
 and \IfSansSerif
References: <9f71d7d5-b9bb-ceeb-6acb-e889821eeeb9@gmail.com>
 <82871fad-83e9-6d46-7e6c-d01a558d8dd5@gmail.com>
 <20210817182951.GP4126399@paulmck-ThinkPad-P17-Gen-1>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <19174709-20c4-1de5-5977-7ab0e7dd5622@gmail.com>
Date: Wed, 18 Aug 2021 08:31:05 +0900
MIME-Version: 1.0
In-Reply-To: <20210817182951.GP4126399@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On Tue, 17 Aug 2021 11:29:51 -0700, Paul E. McKenney wrote:
> On Tue, Aug 17, 2021 at 07:21:27PM +0900, Akira Yokosawa wrote:
>> Using \IfEbookSize or \IfSansSerif macro in the middle of a paragraph
>> can cause extra white spaces around it.
>> Fix this by adding the \ignorespaces command in their definitions.
>>
>> Also update the conditional text in styleguide.
>>
>> As the other conditional macros aren't used in this manner, they are
>> not modified for the moment.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>>  appendix/styleguide/styleguide.tex | 5 +++--
>>  perfbook-lt.tex                    | 6 ++++--
>>  2 files changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/appendix/styleguide/styleguide.tex b/appendix/styleguide/styleguide.tex
>> index 9bb9683f..24e891a3 100644
>> --- a/appendix/styleguide/styleguide.tex
>> +++ b/appendix/styleguide/styleguide.tex
>> @@ -1013,8 +1013,9 @@ namely \qco{$-$}.\footnote{This rule assumes that math mode uses the
>>    same upright glyph as text mode.
>>    Our default font choice meets the assumption.
>>  \IfSansSerif{
>> -  One of the experimental targets ``1csf'' \emph{does} use a differnt font
>> -  for math mode figures as of October 2017.}{}
>> +  Experimental targets with sans-serif fonts such as
>> +  ``1csf'' and ``ebsf'' \emph{do} use a differnt font
> 
> I did s/differnt/different/ here.  This looks like the sort of typo
> that I would make!  ;-)

So, I made the typo way back in 2017.
A typo in a footnote in Style Guide is unlikely to be caught. ;-)

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>> +  for math mode figures as of August 2021.}{}
>>  }
>>  For example,
>>  
>> diff --git a/perfbook-lt.tex b/perfbook-lt.tex
>> index 62959e04..b1c4f780 100644
>> --- a/perfbook-lt.tex
>> +++ b/perfbook-lt.tex
>> @@ -117,13 +117,15 @@
>>  \newcommand{\IfHardCover}[2]{\ifthenelse{\boolean{hardcover}}{#1}{#2}}
>>  \newboolean{ebooksize}
>>  \setboolean{ebooksize}{false}
>> -\newcommand{\IfEbookSize}[2]{\ifthenelse{\boolean{ebooksize}}{#1}{#2}}
>> +\newcommand{\IfEbookSize}[2]{\ifthenelse{\boolean{ebooksize}}%
>> +  {\ignorespaces#1\ignorespaces}{\ignorespaces#2\ignorespaces}}
>>  \newboolean{afourpaper}
>>  \setboolean{afourpaper}{false}
>>  \newcommand{\IfAfourPaper}[2]{\ifthenelse{\boolean{afourpaper}}{#1}{#2}}
>>  \newboolean{sansserif}
>>  \setboolean{sansserif}{false}
>> -\newcommand{\IfSansSerif}[2]{\ifthenelse{\boolean{sansserif}}{#1}{#2}}
>> +\newcommand{\IfSansSerif}[2]{\ifthenelse{\boolean{sansserif}}%
>> +  {\ignorespaces#1\ignorespaces}{\ignorespaces#2\ignorespaces}}
>>  \newboolean{lmttforcode}
>>  \setboolean{lmttforcode}{true}
>>  \newcommand{\IfLmttForCode}[2]{\ifthenelse{\boolean{lmttforcode}}{#1}{#2}}
>> -- 
>> 2.17.1
>>
>>
