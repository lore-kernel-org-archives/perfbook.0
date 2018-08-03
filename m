Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uVfQt8cvlR/eyyGfVnbqpZewsAA5PN091VfMfI/b/rM=;
 b=eSI2aOqWqAKSBmnv60tizlToTvA9tTJBCqtdU490IPctwupx9sdZVjpfri3YDnZz1M
 hrnFxgisFkbS7UgQczA7/jpEKAPBq6PLTYxGdee/ItlaFi/JmNxgFkdF0Wg4c8XoY+MG
 glyslv0Jerm7ofdhKugqBYtDui0DUSwU1Vjw7QaqoNDUDrmXUted8ybuzptb7bgKBNOM
 zDqpTsUOkR81gua92+6vwz4ZPm+ABd4MIM3386c+VHr8w12bNmEZLiKmZFPKVm1vcVDu
 1RLVwPF4kHrxLhCONTjypA84JubvnQOZxnb6kO3Lf6PAUjoaUqorBfQOBy0FIaC9I1GX
 EYug==
Subject: Re: [GIT PULL v3] Trial of labeling lines in code snippets
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
 <18fcce90-11d6-4ab1-c6fc-73791a305091@gmail.com>
 <20180803143557.GA24813@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <7b5ac9b5-c812-12a1-0cb1-e09ac99415bf@gmail.com>
Date: Sat, 4 Aug 2018 00:02:25 +0900
MIME-Version: 1.0
In-Reply-To: <20180803143557.GA24813@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/08/03 07:35:57 -0700, Paul E. McKenney wrote:
> On Fri, Aug 03, 2018 at 07:34:51AM +0900, Akira Yokosawa wrote:
>> Hi Paul,
>>
>> This is v3 of the trial of fancyvrb scheme.
>>
>> Changes in v2 -> v3
>>
>>     o Define "linelabel" and "lineref" environments and use them in the early part of
>>       toolsoftrade.
>>     o Define "VerbatimU" env for short snippet with no line count and use it for
>>       a couple of snippet in toolsoftrade.
>>     o Rename "VerbatimM" to "VerbatimN".
>>     o Remove "[EXP]" in commit log titles.
>>
>>           Thanks, Akira
>>
>> ---
>> The following changes since commit 3b62f67a76e15f8d8f8190a4252362d4ac0cdf23:
>>
>>   Regenerating the atomic counter graph on a more modern CPU (2018-07-23 13:47:51 -0700)
>>
>> are available in the git repository at:
>>
>>   https://github.com/akiyks/perfbook.git trial-fancyvrb-20180802a
>>
>> for you to fetch changes up to 6bf7a51b7b9dadf54a0b1edc8959fafed0fcf671:
>>
>>   Add 'linelabel' and 'lineref' environment (2018-08-03 07:21:49 +0900)
>>
>> ----------------------------------------------------------------
>> Akira Yokosawa (9):
>>       toolsoftrade: Add labels in code samples as comments
>>       Add script to extract code snippet from code sample
>>       toolsoftrade: Reference line in code snippets by label
>>       Update hyphen2endash
>>       Add *.fcv to .gitignore
>>       Automate sub makefile update
>>       Specify lmtt font for VerbatimM env
>>       toolsoftrade: Use \lnlbl in inline code snippet
>>       Add 'linelabel' and 'lineref' environment
>>
>>  .gitignore                              |   2 +
>>  CodeSamples/api-pthreads/api-pthreads.h |  18 +--
>>  CodeSamples/toolsoftrade/forkjoinvar.c  |  12 +-
>>  CodeSamples/toolsoftrade/pcreate.c      |   7 +-
>>  Makefile                                |  14 ++-
>>  perfbook.tex                            |  21 ++++
>>  toolsoftrade/toolsoftrade.tex           | 211 +++++++++++---------------------
>>  utilities/fcvextract.pl                 | 166 +++++++++++++++++++++++++
>>  utilities/gen_snippet_mk.pl             |  55 +++++++++
>>  utilities/hyphen2endash.sh              |   3 +
>>  10 files changed, 351 insertions(+), 158 deletions(-)
>>  create mode 100755 utilities/fcvextract.pl
>>  create mode 100755 utilities/gen_snippet_mk.pl
> 
> Looks nice!
> 
> However, I tried updating a label in CodeSamples/toolsoftrade/forkjoinvar.c
> like this (and yes, this is a nonsensical change just for testing):
> 
> ------------------------------------------------------------------------
> 
> diff --git a/CodeSamples/toolsoftrade/forkjoinvar.c b/CodeSamples/toolsoftrade/forkjoinvar.c
> index 1580478fe2f9..642451d9e880 100644
> --- a/CodeSamples/toolsoftrade/forkjoinvar.c
> +++ b/CodeSamples/toolsoftrade/forkjoinvar.c
> @@ -35,11 +35,11 @@ int main(int argc, char *argv[])
>  	if (pid == 0) { /* child */
>  		x = 1;					//\lnlbl{setx}
>  		printf("Child process set x=1\n");	//\lnlbl{print:c}
> -		exit(EXIT_SUCCESS);			//\lnlbl{exit:s}
> +		exit(EXIT_SUCCESS);
>  	}
>  	if (pid < 0) { /* parent, upon error */
>  		perror("fork");
> -		exit(EXIT_FAILURE);
> +		exit(EXIT_FAILURE);			//\lnlbl{exit:s}
>  	}
>  
>  	/* parent */
> 
> ------------------------------------------------------------------------
> 
> When I typed "make", I got this:
> 
> ------------------------------------------------------------------------
> 
> $ make
> sh utilities/autodate.sh >autodate.tex
> ./utilities/gen_snippet_mk.pl > CodeSamples/snippets.mk
> Use of uninitialized value $_ in substitution (s///) at ./utilities/gen_snippet_mk.pl line 47.
> Use of uninitialized value $_ in concatenation (.) or string at ./utilities/gen_snippet_mk.pl line 48.

Thanks for testing!

Looks like gen_snippet_mk.pl need some brush up. Or there might be missing
dependencies in Makefile.
I admit the new scripts have been tested only in a limited circumstances...
I will respin soon.

> echo > qqz.tex
> echo > contrib.tex
> echo > origpub.tex
> make -C CodeSamples -f snippets.mk
> make[1]: Entering directory `/home/git/perfbook/CodeSamples'
>  --> toolsoftrade/toolsoftrade.fcv
>  Use of uninitialized value $extract_labelbase in concatenation (.) or string at ../utilities/fcvextract.pl line 115.
>  make[1]: *** [toolsoftrade/toolsoftrade.fcv] Error 1
>  make[1]: Leaving directory `/home/git/perfbook/CodeSamples'
>  make: *** [perfbook_flat.tex] Error 2
> 
> ------------------------------------------------------------------------
> 
> I typed "make" again and no errors.  Plus it did update as I expected it
> to.  And when I changed it back, it built the first time without errors.
> 
> Do I perhaps have a shortcoming in my (admittedly ancient) environment?
> Or is this something that happens the first time the new functionality
> is exercised on a change?
> 
> But even so, this is -way- more convenient than my old approach of doing
> all the changes by hand!!!

Glad to know you liked it! ;-)

        Akira

> 
> 							Thanx, Paul
> 

