Return-Path: <bsingharora@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:date:message-id:subject:from:to
 :cc;        bh=2VaEjTSGXrYUl7FUSccM1rXH8vX8THYE6gE/q32QJoM=;
 b=Zvx0rldA0lhHE1G84VF9HcfQAYeI11tbO5FrvHleqCBab79BfKqTaE8dJutS/0Mw84
 kqw+kr5HR9okNWXp1UBubS7iKLJ1syYVgSveDfiC6VlNX7HYU9Sd3kXNFErBL2rDLIjN
 8GoQrSpZ/fYjuUaE7Z1xdSOA0BMReF17u+6NDk4gnAjJ4OesOiFESmcJwUEZ+e3hK5Si
 XUdTIWKehgzVhFk99GwnVdPgVApq8oD37ZBAAVZ5AOgGu9PW5dtMuZq/QVw7NjfBWVK7
 sbgz51DmBl+SqGFyCzyzmdyRqyzbZfBFHlcFziy1VT2jO1JgJ7EqHnOnioJSQueNaLg2
 xxyA==
MIME-Version: 1.0
In-Reply-To: <20160421161840.GA3879@linux.vnet.ibm.com>
References: <571883EE.4080103@gmail.com>
 <20160421161840.GA3879@linux.vnet.ibm.com>
Date: Fri, 22 Apr 2016 07:52:19 +1000
Message-ID: 
 <CAKTCnzmSeS85fmCfZKhGbiDNt9gdyOVxWQcdAahT8R3OR+ETpg@mail.gmail.com>
Subject: Re: perfbook patch
From: Balbir Singh <bsingharora@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Paul McKenney <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, Apr 22, 2016 at 2:18 AM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Thu, Apr 21, 2016 at 05:40:30PM +1000, Balbir Singh wrote:
>> Hey, Paul
>>
>> perfbook failed to build on Fedora 23 due to a texlive issue. I am not sure if other users are facing it. In any case I came up with a patch -- update FAQ.txt with an answer. I was not sure if it is worth posting to perfbook mailing list
>>
>> I'm attaching it - FYI. I hope its useful
>>
>> Balbir
>
> Hello, Balbir, and thank you!
>
> I tried it on Ubuntu 14.04, and it works just fine there.  So are you
> OK with the following hijacking of your original patch?
>
>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit 8c4c3c54d4d4246f6b13a914dda9c9ac42bf0c2e
> Author: Balbir Singh <bsingharora@gmail.com>
> Date:   Thu Apr 21 09:16:44 2016 -0700
>
>     Fix build error on Fedora 23 with texlive
>
>     The listings package is broken. The fix suggested is taken from
>     http://osdir.com/ml/general/2014-06/msg50467.html
>
>     Signed-off-by: Balbir Singh <bsingharora@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>
> diff --git a/perfbook.tex b/perfbook.tex
> index ac46e74f6b6f..d607f66b428f 100644
> --- a/perfbook.tex
> +++ b/perfbook.tex
> @@ -35,6 +35,18 @@
>    literate={\_}{}{0\discretionary{\_}{}{\_}}%
>  }
>  %%HTMLNOSKIP
> +\makeatletter
> +\renewcommand\lstinline[1][]{%
> +\leavevmode\bgroup % \hbox\bgroup --> \bgroup
> +\def\lst@boxpos{b}%
> +\lsthk@PreSet\lstset{flexiblecolumns,#1}%
> +\lsthk@TextStyle
> +\ifnum\iffalse{\fi`}=\z@\fi
> +\@ifnextchar\bgroup{%
> +\ifnum`{=\z@}\fi%
> +\afterassignment\lst@InlineG \let\@let@token}{%
> +\ifnum`{=\z@}\fi\lstinline@}}
> +\makeatother
>  \newcommand{\co}[1]{\lstinline[breaklines=yes,breakatwhitespace=yes]{#1}}
>
>  \title{Is Parallel Programming Hard, And, If So, What Can You Do About It?}
>

Absolutely!

Balbir Singh

