Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DuQgUe6xlCa4hEH2ayi222Zro1s8yGp3dExiL/8yyT0=;
 b=kalG0mzFK5Z8FYmF6fKyot71MSbXp80L145YpmiKtmTZ9EJ/0xVITOHJhVMaW1wGgT
 RxyQEK9OKFu6DQrSqwLVQUSMlsEGwEqiwFUR9//KVn56rhV3GOGStDztfK7aSfRqCkzq
 W3JAaanQ1lPrcK2fB4F55nvz8Bqo84dQmbcMtPoNPJwKeNRZCB3l52ZLOBI8lyy5M+fV
 GcgEj4/W/U3aA4GDY/RBGWFp6ZfrdxQ85ULaCXhRPQF9wfPG0Co3OTIFPVYIfc3FBxji
 XOZyppZDx48oU6XF6q2ekugjBn/jo3J/Obpw2kB7E/Hz0Mra3XurKwk5WSCPVuPNsC3Z
 zYmg==
Subject: Re: [PATCH] Advsync: fix typos
References: <1500090706-6325-1-git-send-email-junchangwang@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <95b9a42a-9da0-69c8-2e13-2e4a7facf3be@gmail.com>
Date: Sat, 15 Jul 2017 14:20:10 +0900
MIME-Version: 1.0
In-Reply-To: <1500090706-6325-1-git-send-email-junchangwang@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Jason,

On 2017/07/15 11:51:46 +0800, Junchang Wang wrote:
> Hi Paul,
> 
> I have read through Chapter Advance Synchronization, and following are two
> typos. Please take a look. Thanks for this excellent book!
> 
> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
> ---
>  advsync/memorybarriers.tex | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
> index c9c975c..009dc6e 100644
> --- a/advsync/memorybarriers.tex
> +++ b/advsync/memorybarriers.tex
> @@ -950,7 +950,7 @@ thereby forcing the required ordering on all platforms.
>  \label{fig:advsync:S Address-Dependency Litmus Test}
>  \end{figure}
>  
> -But suppose that the dependent operation is a write rather than
> +But what happens if the dependent operation is a write rather than
>  a read, for example, in the \emph{S}
>  litmus test~\cite{JadeAlglave2011ppcmem} shown in
>  Figure~\ref{fig:advsync:S Address-Dependency Litmus Test}?
> @@ -2511,7 +2511,7 @@ Failure to follow this rule can have serious side effects:
>  	In theory, yes, you could load an integer, perhaps to use
>  	it as an array index.
>  	In practice, the compiler knows too much about integers,
> -	and thus has way too many opportunities to break your
> +	and thus has too many opportunities to break your

This "way" is an adverb for emphasizing. It might sound colloquial
but it's the tone in perfbook. So I would NAK this hunk.

Also, the format of this message would result in your greetings being
included in the commit log if it were applied as is.
It would be better if you put the greetings between "---" and diff stat.

For the 1st hunk, I would suggest a commit title something like:

    advsync: Rephrase question as such

Can you try a respin with the following tag?

Suggested-by: Akira Yokosawa <akiyks@gmail.com>

      Thanks, Akira

>  	dependency chain.
>  \end{enumerate}
>  
> 

