Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=qCZVznULIZ98ioB9is1SsJ6y74LWnQcxmN1drmcxF5k=;
 b=T6mO9lsS0fRy00bzCjpm8WF8N/tdRKcfcnWVDVpYkbXpA3dg2oNLJnfy3XBwEU0Eed
 VYY5seMKIZC4v7rn3+Y6rILQZNeTxoaC8HNmPurt03dpcsRh/StV28N1T5TCnDwiYoHP
 6ab+XE0zAVDXQRqXgyRFF31GEXuCJbj51KELlMGYRw4/+F0gFdE3YBjXFXhGTLN3mjEn
 d3ozeohZXAZIV8sCs6yUXHVog2dCUZkQZYi74gcpYgbMk0sd9ymltX8qVpP+VVFrkjoK
 NHpLUkZViTEOotENM6hsbpjF6u++UrWRwrWupo67edE9QCoisZVYp0l+ROP/DMm5SjUi d0Og==
Subject: Re: [GIT PULL] Cosmetic fixes round 3 and other fixes
References: <8ed6c47e-5844-4ee0-d42e-0c038f27daec@gmail.com>
 <20160710144141.GW4650@linux.vnet.ibm.com>
 <7bc131c6-d5af-f8b7-dbf3-53de265ea5a7@gmail.com>
 <20160710153502.GY4650@linux.vnet.ibm.com>
 <bd5ad965-7472-494c-ff18-0bb6a1ed00af@gmail.com>
 <20160710232236.GB4650@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <135968d9-8c82-27df-da7b-4c7ec55a93d6@gmail.com>
Date: Mon, 11 Jul 2016 20:55:14 +0900
MIME-Version: 1.0
In-Reply-To: <20160710232236.GB4650@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/07/10 16:22:36 -0700, Paul E. McKenney wrote:
> On Mon, Jul 11, 2016 at 08:01:23AM +0900, Akira Yokosawa wrote:
>> On 2016/07/10 08:35:02 -0700, Paul E. McKenney wrote:
>>> On Mon, Jul 11, 2016 at 12:08:11AM +0900, Akira Yokosawa wrote:
>>>> On 2016/07/10 23:41, Paul E. McKenney wrote:
>>>>> On Sat, Jul 09, 2016 at 03:24:51PM +0900, Akira Yokosawa wrote:
>>>>>> Hi Paul,
>>>>>>
>>>>>> Today, because of the weather, I have time to do clean up the cosmetic
>>>>>> fixes. Appended are two pull requests.
>>>>>
>>>>> Very good!  I pulled both and pushed them out.  I made a small change
>>>>> to the label for the table that you (rightly) changed to a figure,
>>>>> so that it is prefixed by "tab:" rather than "fig:".
>>>>>
>>>>
>>>> Oh, I missed those labels...
>>>>
>>>> So, I reviewed latex source of recently added figures.
>>>> You are still using 'center' environment within 'figure' environment.
>>>> That will cause extra small vertical spacing between the body of the
>>>> figure and its caption.
>>>>
>>>> In stead of doing such as:
>>>>
>>>> \begin{figure}[tb]
>>>> \begin{center}
>>>> \resizebox{{2.5in}{!}{\includegraphics{path-to-figure}}
>>>> \end{center}
>>>> \caption{foo bar}
>>>> \label{fig:foo bar}
>>>> \end{figure}
>>>>
>>>> please do this way:
>>>>
>>>> \begin{figure}[tb]
>>>> \centering
>>>> \resizebox{{2.5in}{!}{\includegraphics{path-to-figure}}
>>>> \caption{foo bar}
>>>> \label{fig:foo bar}
>>>> \end{figure}
>>>
>>> I fixed the one that I added to defer/refcnt.tex, good catch.
>>>
>>>> Also, there are templates in ".Templates/figure-graphics" that
>>>> use the 'center' environment. They should also be fixed to use
>>>> \centering instead.
>>>
>>> Actually, unless you have objections, I intend to remove them.  My
>>> practice for a long time has been to copy existing figures.  In fact,
>>> I had forgotten that the .Template directory even existed.  ;-)
>>
>> I found the template by using emacs' 'grep-find' function.
>> So feel free to remove them.
>>
>> There remains one use of 'center' environment in
>> /advsync/memorybarriers.tex.
>> I left it as is since it is not nested in another environment.
>>
>> But it might be a good idea to promote it to a full-fledged figure with
>> a caption. It's up to your preference.
>
> There are a number of minipage environments that might want to be
> figures.  But there are so many of them in some places that latex's
> figure-placement algorithm gets overwhelmed.
>
>> And there is another suggestion I'd like to make.
>>
>> Wouldn't it be a good idea to advertize the cross-link feature of qqz
>> somewhere, for example in the Answer of Quick Quick 1.3?
>
> Like this?
>
> 							Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit 22f83a69d5dd496456b3975c5482b20af002927a
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Sun Jul 10 16:20:22 2016 -0700
>
>     Add instructions on using quick-quiz hyperlinks
>
>     Reported-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>
> diff --git a/howto/howto.tex b/howto/howto.tex
> index 7c6ef9de4739..177395fc85ca 100644
> --- a/howto/howto.tex
> +++ b/howto/howto.tex
> @@ -206,6 +206,12 @@ Here are a few possible strategies:
>  	expect to be called upon to generate parallel solutions given
>  	only a blank sheet of paper.
>  \end{enumerate}
> +
> +Note that as of mid-2016 the quick quizzes are hyperlinked
> +to the answer and vice versa, courtesy of Paolo Bonzini
> +and Akira Yokosawa.
> +Click either the ``Quick Quiz'' headings or the small squares
> +to move back and forth between quiz and answer.
>  } \QuickQuizEnd
>
>  In short, if you need a deep
>
>

Well, I'm a bit annoyed to see my name here...
What about the appended patch? (You have pushed the above changes, so
this is relative to current master).
And please do *not* apply this as is. I prefer a Reported-by: tag here.

If you do want to mention our names, somewhere in Appendix F would be
a better place. I'm not insisting. It's up to your preference.

------------------------------------------------------------------------

commit bd7618fa0b56b891abb2266fd89a3b061a22d932
Author: Akira Yokosawa <akiyks@gmail.com>
Date:   Mon Jul 11 20:38:41 2016 +0900

     howto: Modify instructions on using quick-quiz hyperlinks
     
     Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

diff --git a/howto/howto.tex b/howto/howto.tex
index 177395f..3daf5ce 100644
--- a/howto/howto.tex
+++ b/howto/howto.tex
@@ -208,10 +208,10 @@ Here are a few possible strategies:
  \end{enumerate}
  
  Note that as of mid-2016 the quick quizzes are hyperlinked
-to the answer and vice versa, courtesy of Paolo Bonzini
-and Akira Yokosawa.
-Click either the ``Quick Quiz'' headings or the small squares
-to move back and forth between quiz and answer.
+to the answer and vice versa.
+While reading in a PDF reader, click either the ``Quick Quiz''
+headings or the small squares at the end to move back and forth
+between quiz and answer.
  } \QuickQuizEnd
  
  In short, if you need a deep

