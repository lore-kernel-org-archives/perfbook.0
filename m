Return-Path: <SRS0=sCbS=6I=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=joldigP4O++tqaOsMIvjGMRO6OgWAKrLDl3gO74tQ3Q=;
        b=eD+ms73KWQYfkDjNbTceg3T9oXRfXomYlvfjQttAUS85/F1F8nSK1B8mTV8uZ+jM47
         nnO0KSVeJa344o6ZeZVU3ky7Q+wY9TFP1ZHHR72Aqwh5W84lT0l6pRcdJEjzddMaGc0n
         9he4NW3HKdrJjIUc834sDX4GRGvvU7OZQ1qvltcsHhuPBv6YSb+kZ6Uraj+1+3ZIZkkc
         E1KaWBMJa8FhcYFwUGNLCar5w/xnyFyhHHKoH2nLx7J8MQcxsGuM31i8QMfZXEHDWnKl
         scGVLZ3wlNJm11nFLppUCF0Aj6+v6P9St1EmLDTI9OVw+PLppRuLFznyzczqJprYmIt1
         C0QA==
Message-ID: <7b6bc6fd-f19f-b50f-b5f2-8e948d60a67e@gmail.com>
Date: Sun, 12 Feb 2023 21:02:12 +0900
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/4] debugging: Use \co{} for 'time' output examples
References: <20230211171008.9415-1-sj38.park@gmail.com>
 <20230211171008.9415-2-sj38.park@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230211171008.9415-2-sj38.park@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj38.park@gmail.com>
Cc: perfbook@vger.kernel.org, sj@kernel.org, paulmck@kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi SeongJae,

I might be nit-picky, but just couldn't help.

On Sat, 11 Feb 2023 09:10:05 -0800, SeongJae Park wrote:
> A quick quiz answer in debugging.tex is wrapping 'time' example outputs
> with only `` and ''.  Use \qco{} instead.

In the subject, "Use \co{} for ..." should be "Use \qco{} for ...".

        Thanks, Akira

> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  debugging/debugging.tex | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index a5324a14..fde2d446 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -257,8 +257,8 @@ validation is just job for you.
>  		consumed in system mode by a CPU-bound program?
>  	\item	Do you have a test case in which all three times
>  		are zero?
> -	\item	Do you have a test case in which the ``user'' and ``sys''
> -		times sum to more than the ``real'' time?
> +	\item	Do you have a test case in which the \qco{user} and \qco{sys}
> +		times sum to more than the \qco{real} time?
>  		(This would of course be completely legitimate in
>  		a multithreaded program.)
>  	\item	Do you have a set of tests cases in which one of the
> @@ -267,7 +267,7 @@ validation is just job for you.
>  		times uses more than ten seconds?
>  	\item	Do you have a set of test cases in which one of the
>  		times has non-zero minutes?
> -		(For example, ``15m36.342s''.)
> +		(For example, \qco{15m36.342s}.)
>  	\item	Do you have a set of test cases in which one of the
>  		times has a seconds value of greater than 60?
>  	\item	Do you have a set of test cases in which one of the
> @@ -279,21 +279,21 @@ validation is just job for you.
>  		times has a positive minutes value but a negative
>  		seconds value?
>  	\item	Do you have a set of test cases in which one of the
> -		times omits the ``m'' or the ``s''?
> +		times omits the \qco{m} or the \qco{s}?
>  	\item	Do you have a set of test cases in which one of the
>  		times is non-numeric?
> -		(For example, ``Go Fish''.)
> +		(For example, \qco{Go Fish}.)
>  	\item	Do you have a set of test cases in which one of the
>  		lines is omitted?
> -		(For example, where there is a ``real'' value and
> -		a ``sys'' value, but no ``user'' value.)
> +		(For example, where there is a \qco{real} value and
> +		a \qco{sys} value, but no \qco{user} value.)
>  	\item	Do you have a set of test cases where one of the
>  		lines is duplicated?
>  		Or duplicated, but with a different time value for
>  		the duplicate?
>  	\item	Do you have a set of test cases where a given line
>  		has more than one time value?
> -		(For example, ``real 0m0.132s 0m0.008s''.)
> +		(For example, \qco{real 0m0.132s 0m0.008s}.)
>  	\item	Do you have a set of test cases containing random
>  		characters?
>  	\item	In all test cases involving invalid input, did you
