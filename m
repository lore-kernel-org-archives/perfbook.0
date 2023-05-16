Return-Path: <SRS0=N/JM=BF=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684231669; x=1686823669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h4wfi8X9lb8h/foJcEurYBvCktphuqlgZjTjo644mlo=;
        b=MKjQWGYZz2N0iok2sCF4DfylyzzhEmwDnXNJOKTmP4NfNAw+IfBndES3zhKQFz1sLm
         sxMNlDWs+qKvjQzMX01c7gYCnHfMxsg36G5Av81LkQPMrK2Ljurfcu/3r5m99+oOdgk8
         BaN1f/PDPMVs4CfyVQcI3yvrZs+KPDOv4i9Bu+qs04neZLIdQyT2BomVEZsGSYwe2yFF
         y2bmvZHIwFiRXZ/ECGXenrBTPffGzA7VJGxLSvu7W1eRXo8hXkMR17qu3zxzcLbEBAoS
         YdpzY6tl+10q2Xt0geSHU246G6842MEGAWdG9xpdKpRIwoxTBOG2TDzujIxvFnIWZrvR
         IQcA==
Message-ID: <8c07d99a-cc0b-c277-4a09-d7072c70911d@gmail.com>
Date: Tue, 16 May 2023 19:07:43 +0900
MIME-Version: 1.0
Subject: Re: [PATCH] formal/spinhint: Clarify the proof
References: <20230514145123.37079-1-mmpgouride@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20230514145123.37079-1-mmpgouride@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: Alan Huang <mmpgouride@gmail.com>, paulmck@kernel.org
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Alan,

On Sun, 14 May 2023 14:51:23 +0000, Alan Huang wrote:
> The third step and the fourth step seem to have no causal relationship between them.

Why do you expect causal relationship between the two?

> Therefore, this patch explains under what circumstances both counters will be at least 1.
> 
> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
> ---
>  formal/spinhint.tex | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/formal/spinhint.tex b/formal/spinhint.tex
> index 16764aef..dd2e88cc 100644
> --- a/formal/spinhint.tex
> +++ b/formal/spinhint.tex
> @@ -1103,8 +1103,9 @@ follows:
>  	execution.
>  \item	The counter corresponding to this reader will have been
>  	at least 1 during this time interval.
> -\item	The \co{synchronize_qrcu()} code forces at least one
> -	of the counters to be at least 1 at all times.
> +\item	If the counter corresponding to this reader is 1, then
> +	the other counter is at least 1 because of the completion of
> +	counter flip.
>  \item	Therefore, at any given point in time, either one of the
>  	counters will be at least 2, or both of the counters will
>  	be at least one.

"Therefore" on item 4 looks to me assumes all of items 1, 2, and 3.

What am I missing?

        Thanks, Akira
