Return-Path: <SRS0=zMGp=VP=gmail.com=haolee.swjtu@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KEKAn2Jrjm1YwFrzl+csTwNovQ8hrALyC1ivIW+S/fA=;
        b=SaPAF8eh89YGmJNAGYKmJHdIfef2McEngJeJbsuYOL9ofgyU+2B4et1lx9rWxTw6Md
         9is1KxCtGYRHjRPSgVcxFQWkhKK7VkwcXqllGjfrUgjvIUlWFzSDzx0GKL2QkCMOA/tm
         x+T/972ic4KXW0Yl1PheFTbg5e4mTrnw8bSHBX8SahnMzHvVm7THXevdluJDVzSx+hXn
         YZ2ZAe70yHri2tDTX5tCwhC5f5C7Eba0vjraU/1psYlwbSVmdZyIJssRPv4LtDlRT9zm
         zBfIca/JCx2RsYLvVr0qO2zNri4rp/Giol7/3JTHcAuIMDeWeo0+pzx4mbtpY16E0tqF
         4j0A==
Date: Sat, 7 May 2022 14:05:47 +0000
From: Hao Lee <haolee.swjtu@gmail.com>
Subject: Re: [PATCH] whymb: convert event sequence without store forwarding
 to table
Message-ID: <20220507140547.GA17192@haolee.io>
References: <20220505043732.GA24693@haolee.io>
 <20220506191559.GH1790663@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220506191559.GH1790663@paulmck-ThinkPad-P17-Gen-1>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Fri, May 06, 2022 at 12:15:59PM -0700, Paul E. McKenney wrote:
> On Thu, May 05, 2022 at 04:37:32AM +0000, Hao Lee wrote:
> > To make the process more clear, introduce a "CPU operations" column
> > which represents micro-operations.
> > 
> > Signed-off-by: Hao Lee <haolee.swjtu@gmail.com>
> 
> The table does look much better, thank you!
> 
> However, there are a couple of adjustments required:
> 
> 1.	
> 	Combine the "Instruction" and "CPU operation" columns in the same
> 	way as Table 15.1 and with the same column header.  One reason
> 	is compatibility in order to avoid confusing readers and another
> 	reason is to accomodate three-CPU examples.

Combining the two columns can save more space, but one line of code
could involve several MESI operations. If we mix C code and MESI
operations in the same column, would this way confuse readers? Or maybe
we can omit C code entirely and only use natural language to describe
operations.

> 
> 2.	Add a "Store Buffer" column to CPU 1.  Yes, it is not used in
> 	this example, but it helps those readers who might have missed
> 	the fact that every CPU has a store buffer.

Agree.

> 
> 3.	Please leave the list in place.  Feel free to modify it
> 	to indicate which row goes with which step in the sequence.
> 	Either way, I will wordsmith it to be similar to the discussion
> 	of the tables in Chapter 15.
> 
> 	Yes, at this point -you- might be able to work out what is
> 	going on from the table itself and the summary you produced,
> 	but that won't be the common case.

Ah, yes, got it!

> 
> And yes, Table C.1 is an odd special case at this point.  Maybe we
> should leave it as it is, or maybe it should be converted to the common
> form.  Thoughts?

This brings me to another question. In my view, although Table 15.1 is
concise, it is less clear than the event sequence in Appendix C. I
thought about Table 15.1 for several minutes to figure out what event
sequence it wanted to express. If we are not limited to this A4 size PDF
page, I think a more readable form is something like a UML sequence
diagram. At this point, I even think Table C.1 is better than Table 15.1
because it's a combination of event sequence and common table like Table
15.1. It seems better if we convert the event sequence to a table like
Table C.1 while leaving the event sequence in place as a supplement.

Thanks,
Hao Lee

> 
> 							Thanx, Paul
> 
> > ---
> >  appendix/whymb/whymemorybarriers.tex | 74 ++++++++++++++++++----------
> >  1 file changed, 47 insertions(+), 27 deletions(-)
> > 
> > diff --git a/appendix/whymb/whymemorybarriers.tex b/appendix/whymb/whymemorybarriers.tex
> > index 2140eb8a..e9c4665b 100644
> > --- a/appendix/whymb/whymemorybarriers.tex
> > +++ b/appendix/whymb/whymemorybarriers.tex
> > @@ -752,29 +752,50 @@ However, if one were foolish enough to use the very simple architecture
> >  shown in
> >  \cref{fig:app:whymb:Caches With Store Buffers},
> >  one would be surprised.
> > -Such a system could potentially see the following sequence of events:
> > -\begin{sequence}
> > -\item	CPU~0 starts executing the \co{a = 1}.
> > -\item	CPU~0 looks ``a'' up in the cache, and finds that it is missing.
> > -\item	CPU~0 therefore sends a ``read invalidate'' message in order to
> > -	get exclusive ownership of the cache line containing ``a''.
> > -\item	CPU~0 records the store to ``a'' in its store buffer.
> > -\item	CPU~1 receives the ``read invalidate'' message, and responds
> > -	by transmitting the cache line and removing that cacheline from
> > -	its cache.
> > -\item	CPU~0 starts executing the \co{b = a + 1}.
> > -\item	CPU~0 receives the cache line from CPU~1, which still has
> > -	a value of zero for ``a''.
> > -\item	CPU~0 loads ``a'' from its cache, finding the value zero.
> > -	\label{item:app:whymb:Need Store Buffer}
> > -\item	CPU~0 applies the entry from its store buffer to the newly
> > -	arrived cache line, setting the value of ``a'' in its cache
> > -	to one.
> > -\item	CPU~0 adds one to the value zero loaded for ``a'' above,
> > -	and stores it into the cache line containing ``b''
> > -	(which we will assume is already owned by CPU~0).
> > -\item	CPU~0 executes \co{assert(b == 2)}, which fails.
> > -\end{sequence}
> > +Such a system could potentially see the sequence of events in
> > +\Cref{tab:app:whymb:Load without store forwarding}.
> > +
> > +Row~1 shows the initial state, where CPU~0 has \co{b} in its cache and CPU~1
> > +has \co{a} in its cache, both variables having a value of zero.
> > +Row~2-5 store 1 to variable \co{a} and Row~6-9 calculate \co{b}. Row~10
> > +does an assertion which is failed.
> > +
> > +\begin{table*}
> > +\rowcolors{6}{}{lightgray}
> > +\renewcommand*{\arraystretch}{1.1}
> > +\small
> > +\centering\OneColumnHSpace{-0.1in}
> > +\ebresizewidth{
> > +\begin{tabular}{llllllll}
> > +	\toprule
> > +	& \multicolumn{4}{c}{CPU 0} &  & \multicolumn{2}{c}{CPU 1} \\
> > +	\cmidrule(l){2-5} \cmidrule(l){7-8}
> > +	& Instruction & CPU operations & Store Buffer & Cache &  &
> > +		CPU operations & Cache \\
> > +	\cmidrule{1-1} \cmidrule(l){2-5} \cmidrule(l){7-8}
> > +	1 & (Initial state) &  &  & \tco{b==0} &  & (Initial state)
> > +		& \tco{a==0} \\
> > +	2 & \tco{a = 1;} & read and invalidate \tco{a} &  & \tco{b==0}
> > +		&  &  & \tco{a==0} \\
> > +	3 &  & record \tco{a} to StoreBuffer & \tco{a==1} & \tco{b==0}
> > +		&  &  & \tco{a==0} \\
> > +	4 &  & wait & \tco{a==1} & \tco{b==0} &  &
> > +		remove \tco{a} and response &  \\
> > +	5 &  & install response to cacheline & \tco{a==1} & \tco{a==0;b==0}
> > +		&  &  &  \\
> > +	6 & \tco{b = a + 1;} & load \tco{a==0} from cacheline & \tco{a==1}
> > +		& \tco{a==0;b==0}
> > +		&  &  &  \\
> > +	7 &  & apply StoreBuffer &  & \tco{a==1;b==0} &  &  &  \\
> > +	8 &  & calculate \tco{a+1} &  & \tco{a==1;b==0} &  &  &  \\
> > +	9 &  & store \tco{b} &  & \tco{a==1;b==1} &  &  &  \\
> > +	10 & \tco{assert(b == 2);} & (failed) &  &  &  &  & \\
> > +	\bottomrule
> > +\end{tabular}
> > +}
> > +\caption{Load without store forwarding}
> > +\label{tab:app:whymb:Load without store forwarding}
> > +\end{table*}
> >  
> >  The problem is that we have two copies of ``a'', one in the cache and
> >  the other in the store buffer.
> > @@ -797,10 +818,9 @@ subsequent loads, without having to pass through the cache.
> >  \label{fig:app:whymb:Caches With Store Forwarding}
> >  \end{figure}
> >  
> > -With store forwarding in place, item~\ref{item:app:whymb:Need Store Buffer}
> > -in the above sequence would have found the correct value of 1 for ``a'' in
> > -the store buffer, so that the final value of ``b'' would have been 2,
> > -as one would hope.
> > +With store forwarding in place, Row~7 in the above sequence would have found
> > +the correct value of 1 for ``a'' in the store buffer, so that the final value
> > +of ``b'' would have been 2, as one would hope.
> >  
> >  \subsection{Store Buffers and Memory Barriers}
> >  \label{sec:app:whymb:Store Buffers and Memory Barriers}
> > -- 
> > 2.21.0
> > 
