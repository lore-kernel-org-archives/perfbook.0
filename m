Return-Path: <SRS0=PKt4=RW=goodmis.org=rostedt@kernel.org>
Date: Tue, 19 Mar 2019 11:33:05 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] toolsoftrade: Fix code listing 4.22 in Chapter 4
Message-ID: <20190319113305.5eb25a6c@gandalf.local.home>
In-Reply-To: <20190319145927.29610-1-kaslevs@vmware.com>
References: <20190319145927.29610-1-kaslevs@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Slavomir Kaslev <kaslevs@vmware.com>
Cc: paulmck@linux.ibm.com, perfbook@vger.kernel.org, slavomir.kaslev@gmail.com
List-ID: <perfbook.vger.kernel.org>

On Tue, 19 Mar 2019 16:59:27 +0200
Slavomir Kaslev <kaslevs@vmware.com> wrote:

> Code listing 4.22 is broken since the READ_ONCE() macro takes a rvalue and the
> expression parenthesis are unbalanced. This patch fixes it.
> 
> Signed-off-by: Slavomir Kaslev <kaslevs@vmware.com>
> ---
>  toolsoftrade/toolsoftrade.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> index 41605a33..4e0764d0 100644
> --- a/toolsoftrade/toolsoftrade.tex
> +++ b/toolsoftrade/toolsoftrade.tex
> @@ -2111,7 +2111,7 @@ Listing~\ref{lst:toolsoftrade:Avoiding Danger, 2018 Style}.
>  \begin{listing}[tbp]
>  \begin{linelabel}[ln:toolsoftrade:Preventing Load Fusing]
>  \begin{VerbatimL}[commandchars=\\\{\}]
> -while (!READ_ONCE((!need_to_stop))
> +while (!READ_ONCE(need_to_stop))

But doesn't this change the logic?

I'm guessing that the double "!" was wrong too.

-- Steve


>  	do_something_quickly();
>  \end{VerbatimL}
>  \end{linelabel}

