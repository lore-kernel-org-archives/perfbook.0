Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xLhwWFIMB2ufZouMxekDXFiTuueQyiLjkcatA95nCIw=;
 b=CGx1PWNJR9MVJ04UKHBLew8XYivmVXYfqDXAzuUsik5iTmdh/SIJETQcxblJN3fFZ/
 nRiqndlHYFhrQgUZFLWtyP3uv9THzzUrpavuy6BNd5EZ3I2uR3Q+viUS8CdkIzrBhdHj
 cKALcO9ralcFbJdk7I+jsOKU3/62MLmmWjd+oUfRAh5lVSVrsSwJFSIlRSlM5M4oI8Yg
 v0MUmW462xgv7pKPfB8LW+3o089wx5WSSKs/9dNUpm3cwM5x1RzQjVm2V6O0Ic0xPzL5
 /ybQwD0c2b4LZjLfA58TpKodFnQItOTDohdcb3Vp8GBMFQPWKIAt833gJTBBBR/WqJhy
 zyUQ==
Subject: Re: [GIT PULL v4] Trial of labeling lines in code snippets
References: <34eef16d-9d74-ac55-a20a-54c2be1c58f2@gmail.com>
 <e8301596-cb58-491d-89aa-ad9a35d21b66@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1acdf809-564b-3557-e869-eaf0c2f64af4@gmail.com>
Date: Sun, 5 Aug 2018 00:15:08 +0900
MIME-Version: 1.0
In-Reply-To: <e8301596-cb58-491d-89aa-ad9a35d21b66@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/08/04 20:57:55 +0900, Akira Yokosawa wrote:
> Hi Paul,
> 
> This is v4 of the trial of fancyvrb scheme.
> 
> Changes since v3:
> 
>     o gen_snippet_mk.pl: Add check of failure mode observed by Paul.
>     o gen_snippet.mk.sh: Remove broken CodeSamples/snippets.mk when the failure
>       is caught.
>     o Add dependencies in Makefile regarding the generation and extraction
>       scripts/sub makefile.
>     o Change "make clean" so that it does not depend on CodeSamples/snippets.mk
>       and remove the sub makefile.
> 
> I'm not sure these changes resolve the issue you encountered.
> Does "make clean; make" work for you now?

I think I found another set of missing dependencies.
At the HEAD of this branch, after the 1st make succeeds,

    (1) remove *.fcv files, and
    (2) just do "make"

does nothing.

This is because the main Makefile does not know the dependencies
of perfbook_flat.tex to *.fcv files.

Those dependencies require yet another sub-makefile to be generated.
I'll append another commit to do so.

I think "make clean; make" should still work as the current form.

        Thanks, Akira

> 
>         Thanks, Akira
> 
> --- 
> The following changes since commit 3b62f67a76e15f8d8f8190a4252362d4ac0cdf23:
> 
>   Regenerating the atomic counter graph on a more modern CPU (2018-07-23 13:47:51 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/akiyks/perfbook.git trial-fancyvrb-20180804a
> 
> for you to fetch changes up to dd1559612728fcf8726a5b367147cc51ca8f27a8:
> 
>   Add dependencis to scripts for extracting code snippets (2018-08-04 19:36:07 +0900)
> 
> ----------------------------------------------------------------
> Akira Yokosawa (11):
>       toolsoftrade: Add labels in code samples as comments
>       Add script to extract code snippet from code sample
>       toolsoftrade: Reference line in code snippets by label
>       Update hyphen2endash
>       Add *.fcv to .gitignore
>       Automate sub makefile update
>       Specify lmtt font for VerbatimM env
>       toolsoftrade: Use \lnlbl in inline code snippet
>       Add 'linelabel' and 'lineref' environment
>       Catch failure in genaration of CodeSamples/snippets.mk
>       Add dependencis to scripts for extracting code snippets
> 
>  .gitignore                              |   2 +
>  CodeSamples/api-pthreads/api-pthreads.h |  18 +--
>  CodeSamples/toolsoftrade/forkjoinvar.c  |  12 +-
>  CodeSamples/toolsoftrade/pcreate.c      |   7 +-
>  Makefile                                |  15 ++-
>  perfbook.tex                            |  21 ++++
>  toolsoftrade/toolsoftrade.tex           | 211 +++++++++++---------------------
>  utilities/fcvextract.pl                 | 168 +++++++++++++++++++++++++
>  utilities/gen_snippet_mk.pl             |  72 +++++++++++
>  utilities/gen_snippet_mk.sh             |   8 ++
>  utilities/hyphen2endash.sh              |   3 +
>  11 files changed, 379 insertions(+), 158 deletions(-)
>  create mode 100755 utilities/fcvextract.pl
>  create mode 100755 utilities/gen_snippet_mk.pl
>  create mode 100644 utilities/gen_snippet_mk.sh
> 

