Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=DclLOcIfAQbWBIVBa2VN/0dQPLjPMgSRsfg88B6vS0M=;
 b=afvOXCe4X9AwTOExGHILjrK87w6Lw8RYMO30w17w87g4aysAzqKc8sHsDwarmujayX
 P9g+XmiwsE+WkTlPMflWttkXs19cXPdLTYw5y5SzGRhLdboQEzK80v143xltF8PwghY/
 5AfOAS769cAQ0mlPQuHGQSkKG6tk2gV8oVrm2cIr6iR0baR7f9H+DwLmLrRmpsTAK505
 BTncVNVdVjyXoZUS+o+wmPgVNnhWsv0GQm5fAxsobhxgFM3RnZGNBhsSl1bIj4VyX/fc
 qlzLsUAcX1J7kqr0QFXpJezvGH06hia7kx5a1TezGrmXOnTvkointlp/zmpYkWr1oQsN
 i7XA==
Subject: Re: [PATCH 09/17] formal/dyntickrcu: Fix typos
References: <20160921024448.24744-1-sj38.park@gmail.com>
 <20160921024448.24744-10-sj38.park@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <21ba5bee-18ed-4f4d-1d1f-7eb4bdbe3f8e@gmail.com>
Date: Wed, 21 Sep 2016 19:57:49 +0900
MIME-Version: 1.0
In-Reply-To: <20160921024448.24744-10-sj38.park@gmail.com>
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj38.park@gmail.com>, paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, akiyks@gmail.com
List-ID: <perfbook.vger.kernel.org>

Hi,

I have a few comments regarding this patch.

On 2016/09/21 11:44:40 +0900, SeongJae Park wrote:
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  formal/dyntickrcu.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
> index 5ede587..1d3e155 100644
> --- a/formal/dyntickrcu.tex
> +++ b/formal/dyntickrcu.tex
> @@ -213,7 +213,7 @@ Line~3 fetches the current CPU's number, while lines~5 and~6
>  increment the \co{rcu_update_flag} nesting counter if it
>  is already non-zero.
>  Lines~7-9 check to see whether we are the outermost level of
> -interrupt, and, if so, whether \co{dynticks_progress_counter}
> +interrupt, and, if so, \co{dynticks_progress_counter}
>  needs to be incremented.
>  If so, line~10 increments \co{dynticks_progress_counter},
>  line~11 executes a memory barrier, and line~12 increments

I think this change is unnecessary.  The original sentence makes
sense for me.

> @@ -887,9 +887,9 @@ is even.
>  Upon failure, \co{spin} writes out a
>  ``trail'' file
>  (\path{dyntickRCU-base-sl-busted.spin.trail})
> -file, which records the sequence of states that lead to the failure.
> +, which records the sequence of states that lead to the failure.
>  Use the {\tt spin -t -p -g -l dyntickRCU-base-sl-busted.spin}
> -command to cause \co{spin} to retrace this sequence of state,
> +command to cause \co{spin} to retrace this sequence of states,
>  printing the statements executed and the values of variables
>  (\path{dyntickRCU-base-sl-busted.spin.trail.txt}).
>  Note that the line numbers do not match the listing above due to
> 

Well, if you put the "," at the beginning of the line, there would be
an extra space (or even a line break) between the ")" and the ",".
A better hunk would be as the following;

> @@ -886,10 +886,10 @@ results in failure, as line~23 is checking that the wrong 
>  is even.
>  Upon failure, \co{spin} writes out a
>  ``trail'' file
> -(\path{dyntickRCU-base-sl-busted.spin.trail})
> -file, which records the sequence of states that lead to the failure.
> +(\path{dyntickRCU-base-sl-busted.spin.trail}),
> +which records the sequence of states that lead to the failure.
>  Use the {\tt spin -t -p -g -l dyntickRCU-base-sl-busted.spin}
> -command to cause \co{spin} to retrace this sequence of state,
> +command to cause \co{spin} to retrace this sequence of states,
>  printing the statements executed and the values of variables
>  (\path{dyntickRCU-base-sl-busted.spin.trail.txt}).
>  Note that the line numbers do not match the listing above due to

                                                  Thanks, Akira

