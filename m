Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0eV2rLeYky8rxlf54+IfKqFNeVKfWG5fUsB/aPy8n8E=;
 b=Nag0fu11mlNBndST496XOAQrLdU2Asrvi9hsky84OMf/2tcgquLgsWipAXcbBGebmb
 t9tOh17JQDAgWMI1Cm6rVNhVhMNnDMRjGzUcfWzhxAzU3p/KLdu1YaYRTrNYB8AIlax1
 /RP9vDt3wCy2vBZ80UJHRE3B+lCn+1u5xKdbkDukPvOfJXbQvY1vizig52ofFPwAqQBL
 gOSeRysAcvzeSFFbEpLV5SbEGbmSEOdOGqlY8bxcl+UwXqbkWvkMHhHlajBpRV1i5Ptx
 Ho6HgbLP48ui8MmiqqZ3huqxuvKh/P/748rvfsD3eWlHp7PcZPWg8eTanXcpXEScP9tV
 0pMg==
Subject: Re: [PATCH v2] Fix labeling of appendix and section
References: <d3ea21c4-ba6f-46e3-15da-cd35d450b59d@gmail.com>
 <c07a5add-15e7-0c0a-b2ef-af96bbde7059@gmail.com>
 <20180409172133.GL3948@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <36926eec-8b4a-76e9-15a1-f4fc354875cc@gmail.com>
Date: Tue, 10 Apr 2018 06:32:32 +0900
MIME-Version: 1.0
In-Reply-To: <20180409172133.GL3948@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/04/09 10:21:33 -0700, Paul E. McKenney wrote:
> On Tue, Apr 10, 2018 at 12:44:58AM +0900, Akira Yokosawa wrote:
>> >From d9d064c4aac8758ccaa435444ff0e60a16a9d6d2 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Tue, 10 Apr 2018 00:30:08 +0900
>> Subject: [PATCH v2] Fix labeling of appendix and section
>>
>> These are a couple of labels which don't match the current
>> context due to movement to/from appendix.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Change from v1:
>>     Fixed typo in commit log.
> 
> Good eyes, applied and queued, thank you!  I changed one additional
> "appendix" to section, please see below for the updated commit, and
> please let me know if I messed anything up.

Ah, I knew I missed something ;-)
I wouldn't be surprised if there were other similar cases.

       Thanks, Akira

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 15e646185e3f404c6d84af4947e598278e53d22d
> Author: Akira Yokosawa <akiyks@gmail.com>
> Date:   Tue Apr 10 00:30:08 2018 +0900
> 
>     Fix labeling of appendix and section
>     
>     These are a couple of labels which don't match the current
>     context due to movement to/from appendix.
>     
>     Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> 
> diff --git a/appendix/toyrcu/toyrcu.tex b/appendix/toyrcu/toyrcu.tex
> index a796401e8d0c..c0a45a85ca03 100644
> --- a/appendix/toyrcu/toyrcu.tex
> +++ b/appendix/toyrcu/toyrcu.tex
> @@ -2,7 +2,7 @@
>  
>  \QuickQuizChapter{chp:app:``Toy'' RCU Implementations}{``Toy'' RCU Implementations}
>  
> -The toy RCU implementations in this section are designed not for
> +The toy RCU implementations in this appendix are designed not for
>  high performance, practicality, or any kind of production use,\footnote{
>  	However, production-quality user-level RCU implementations
>  	are available~\cite{MathieuDesnoyers2009URCU,MathieuDesnoyers2012URCU}.}
> @@ -15,7 +15,7 @@ Chapters~\ref{chp:Introduction},
>  and~\ref{chp:Deferred Processing}
>  for even these toy RCU implementations to be easily understandable.
>  
> -This section provides a series of RCU implementations in order of
> +This appendix provides a series of RCU implementations in order of
>  increasing sophistication, from the viewpoint of solving the
>  existence-guarantee problem.
>  Section~\ref{sec:app:toyrcu:Lock-Based RCU} presents a rudimentary
> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
> index 079840425ca3..40fe3a4919f0 100644
> --- a/memorder/memorder.tex
> +++ b/memorder/memorder.tex
> @@ -4179,7 +4179,7 @@ dependencies.
>  
>  \section{Hardware Specifics}
>  \label{sec:memorder:Hardware Specifics}
> -\OriginallyPublished{Appendix}{sec:memorder:Hardware Specifics}{Memory-Barrier Instructions For Specific CPUs}{Linux Journal}{PaulMcKenney2005i,PaulMcKenney2005j}
> +\OriginallyPublished{Section}{sec:memorder:Hardware Specifics}{Memory-Barrier Instructions For Specific CPUs}{Linux Journal}{PaulMcKenney2005i,PaulMcKenney2005j}
>  
>  \begin{table*}[tbh]
>  \rowcolors{4}{}{lightgray}
> 

