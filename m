Return-Path: <SRS0=8Upf=6C=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2uz+6kB1r5AKP+6ATeeBoq5rr9uA+r3RF9XDPQc3JOY=;
        b=Yg/xE6OekltNNlpazbn3fROehz5w6A3FRy/QYQ6UvReqxTAe3EUiY8AiiaUOJ6Dcog
         k1OGOO7GZ1D+OCRiDis4kfA0DhgybT17k2DSHn1Foj9Bx6LwdhtUApHrnQJ8gMm9KQwL
         y/ShfqGtc+eHhtwORBE0agrQ5RiClyKvWO5OBFajeqgQW7sLUpB5FnWxa+fRJx6ZMFjf
         sMkBLDnqyM0p9fPu/lhYJXAh+kguqC2+P5kHP9WrWiV3dZJ4vU6iF0zQiIdYVi++Mq+Q
         Oe9IYkqE8KVZ+nLgOOzb4qxp2cCfQfSelkOBaWlhcgFdp7uhC4ugixbyzO9F2S8uEYYK
         hKyQ==
Message-ID: <6745658a-5dde-fe09-29dd-4428c34d75f3@gmail.com>
Date: Mon, 6 Feb 2023 11:31:55 +0900
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] debugging: Use \co{} for 'time' output examples
References: <20230205182128.19044-1-sj@kernel.org>
 <20230205182128.19044-2-sj@kernel.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230205182128.19044-2-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj@kernel.org>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi SeongJae,

On Sun,  5 Feb 2023 10:21:24 -0800, SeongJae Park wrote:
> From: SeongJae Park <sj38.park@gmail.com>
> 
> A quick quiz answer in debugging.tex is wrapping 'time' example outputs
> with `` and ''.  Use \co{} instead.
> 
> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> ---
>  debugging/debugging.tex | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/debugging/debugging.tex b/debugging/debugging.tex
> index 4568f90a..3104bb95 100644
> --- a/debugging/debugging.tex
> +++ b/debugging/debugging.tex
> @@ -257,8 +257,8 @@ validation is just job for you.
>  		consumed in system mode by a CPU-bound program?
>  	\item	Do you have a test case in which all three times
>  		are zero?
> -	\item	Do you have a test case in which the ``user'' and ``sys''
> -		times sum to more than the ``real'' time?
> +	\item	Do you have a test case in which the \co{user} and \co{sys}
> +		times sum to more than the \co{real} time?
>  		(This would of course be completely legitimate in
>  		a multithreaded program.)
>  	\item	Do you have a set of tests cases in which one of the
> @@ -267,7 +267,7 @@ validation is just job for you.
>  		times uses more than ten seconds?
>  	\item	Do you have a set of test cases in which one of the
>  		times has non-zero minutes?
> -		(For example, ``15m36.342s''.)
> +		(For example, \co{15m36.342s}.)
>  	\item	Do you have a set of test cases in which one of the
>  		times has a seconds value of greater than 60?
>  	\item	Do you have a set of test cases in which one of the
> @@ -279,21 +279,21 @@ validation is just job for you.
>  		times has a positive minutes value but a negative
>  		seconds value?
>  	\item	Do you have a set of test cases in which one of the
> -		times omits the ``m'' or the ``s''?
> +		times omits the \co{m} or the \co{s}?
>  	\item	Do you have a set of test cases in which one of the
>  		times is non-numeric?
> -		(For example, ``Go Fish''.)
> +		(For example, \co{Go Fish}.)

My preference is to enclose \co{Go Fish} by quotation marks.
That is easier for me to see it as a string.
There is a convenient macro \qco{} for this purpose. You can say:

  +             (For example, \qco{Go Fish}.)

>  	\item	Do you have a set of test cases in which one of the
>  		lines is omitted?
> -		(For example, where there is a ``real'' value and
> -		a ``sys'' value, but no ``user'' value.)
> +		(For example, where there is a \co{real} value and
> +		a \co{sys} value, but no \co{user} value.)
>  	\item	Do you have a set of test cases where one of the
>  		lines is duplicated?
>  		Or duplicated, but with a different time value for
>  		the duplicate?
>  	\item	Do you have a set of test cases where a given line
>  		has more than one time value?
> -		(For example, ``real 0m0.132s 0m0.008s''.)
> +		(For example, \co{real 0m0.132s 0m0.008s}.)

Ditto.

With them taken care of,

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

        Thanks, Akira

>  	\item	Do you have a set of test cases containing random
>  		characters?
>  	\item	In all test cases involving invalid input, did you
