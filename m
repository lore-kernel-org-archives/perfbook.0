Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=vlVIb8hv4CpaMq09GqbRycwZJzdl1yWqbyD9ksmKrGk=;
 b=yxdO8XeZsq0bZhyCxv1W66Eb4bFcP/y9GYuhb9wQklp7Koa9lIDqO+lyboSgwN7zLE
 yeXZtKGc+Qv9vT7ZXDP0ES2mQLrh4ujDjVzOaH9zPPkk0b+kH3/jDg9L5BWNB5Dg3ktY
 uVQHgicMXku4HjNAiF5vk4cul96DVHPGZAIzO8w5WJ1vcVLQjX7yNGrfSC116iBxv6TL
 AGvV6jrOLxqlQyeIX88UWwQeD+zYgpQ1rAemPI/tSb1WnWnO8DSPT06YX5y6CJ2yUays
 ipRYTNl9zB8xozxSkfi0r//FoPE3pscCvUO/JsPhSPjwDqpB2GesKAgIdSCRdTODxVl0
 HIeg==
Subject: Re: [GIT PULL] Cosmetic fixes for chapters 4, 5 and 6
References: <5d5dfa35-bee5-8370-4bab-9780d7ae0219@gmail.com>
 <20160620173209.GT3923@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <e07241f7-e686-bad7-dd20-98f8bfdb8d39@gmail.com>
Date: Wed, 22 Jun 2016 00:31:26 +0900
MIME-Version: 1.0
In-Reply-To: <20160620173209.GT3923@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/06/20 10:32:09 -0700, Paul E. McKenney wrote:
> On Sat, Jun 18, 2016 at 05:43:23PM +0900, Akira Yokosawa wrote:
>> The following changes since commit 17ba9e5472a7eefa5e7af13f708c1df4f772e11b:
>>
>>   cpu: Fix numbers in Performance of Mechanisms tables (2016-06-17 20:54:35 -0700)
>>
>> are available in the git repository at:
>>
>>   https://github.com/akiyks/perfbook.git cosmetic-fixes
>>
>> for you to fetch changes up to 0c2b722d652c4da3b3ba7c0521e50f0f2df57d59:
>>
>>   count: Typo fix ("a Intel" -> "an Intel") (2016-06-18 17:20:35 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (9):
>>       toolsoftrade: Centering figures of verbatim code examples
>>       toolsoftrade: Adjust position of Figure 4.5
>>       toolsoftrade: Use \path command for C source file name
>>       count: Use \path command for C source file name
>>       count: Centering figures of verbatim code examples
>>       count: Tweak position of Figure 5.1
>>       SMPdesign: Use \path command for path names
>>       SMPdesign: Centering figures of verbatim code examples
>>       count: Typo fix ("a Intel" -> "an Intel")
>>
>>  SMPdesign/SMPdesign.tex       |  70 ++++++-----
>>  SMPdesign/beyond.tex          |  42 ++++---
>>  SMPdesign/partexercises.tex   |  32 +++--
>>  count/count.tex               | 270 ++++++++++++++++++++++++------------------
>>  perfbook.tex                  |   1 +
>>  toolsoftrade/toolsoftrade.tex |  98 ++++++++-------
>>  6 files changed, 302 insertions(+), 211 deletions(-)
>
> Thank you, Akira!
>
> I queued this and pushed it, but I am a bit dissatisfied with the position
> of Figure 5.1, stuck between the section heading and the text.  I agree
> that its original position tucked underneath the long footnote 1 is also
> not so good.
>
> I queued and pushed the patch below, which puts it above the section
> heading, but please feel free to further improve it.

Well, as I said in the commit message, it was a compromise.
I compared [hp] and [tp], and picked [hp], because it looks not so good
to have the figure just above the section heading.
I think the best position of the figure in this case is just above the
footnote.

Today, I googled "latex floating figure underneath footnote", and found
that by using 'footmisc' package, it is possible to place a floating figure/
table just above a footnote.
I'm going to test it and if it works as I expect, I'll send a pull request.

                                                       Thanks, Akira  
>
> 							Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit 15ddcdd3ae6bdc088f7c49f78edf62fff5090cfd
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Mon Jun 20 10:30:49 2016 -0700
>
>     Further tweak position of "Just Count!" figure
>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>
> diff --git a/count/count.tex b/count/count.tex
> index d0704536c91c..f4b63687892e 100644
> --- a/count/count.tex
> +++ b/count/count.tex
> @@ -180,7 +180,7 @@ are more appropriate for advanced students.
>   11 }
>  \end{verbbox}
>  }
> -\begin{figure}[hp]
> +\begin{figure}[tp]
>  \centering
>  \theverbbox
>  \caption{Just Count!}
>
>

