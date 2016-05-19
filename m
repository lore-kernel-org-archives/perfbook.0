Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=GNBlMOGi30gzgDGPGsBHQ1Ipmf83fLnN46BsLjeVHCg=;
 b=rX0eeWtvsMsoH3odTiz8cNE8fHGjMUQpzUZ+ngcRTEJi5CnpNSRAe1t7chWpijMBpc
 TZGKppfSGN1f6k2QJNY4gjo7zNXM0I0u9moypxSqZxpt1g3xOn0uWFIb+ddMgnyB6gBD
 M6sKGDzG9tPpbPAxtNFGopzp+NV2p3v3WjV28ERfJWleRP2mzImjcPVo6HLfCBgcbqk2
 9L6NeQY0pACrkU5mwKVTlh3EWI/CdMaS/oxnHdXsfSc33F5GE0zKU/XDXPCub5Dl5RUy
 DGAQb5mOZKudqCGkyvHv3lDc02wTDLJWm7mw3WWUzd+s+XIKXgOcTHgH8VsqTsqbRv+O
 0m8Q==
Subject: Re: [PATCH] Improve messages regarding font installation
References: <0b0668b6-76b8-2490-9777-1e0aa0e10280@gmail.com>
 <09228564-927a-0300-9f7c-7c86915092c0@gmail.com>
 <20160519194651.GV3528@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <27cce515-fa2c-f32e-fb35-ae0439a11207@gmail.com>
Date: Fri, 20 May 2016 07:18:48 +0900
MIME-Version: 1.0
In-Reply-To: <20160519194651.GV3528@linux.vnet.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/05/19 12:46:51 -0700, Paul E. McKenney wrote:
> On Fri, May 20, 2016 at 12:06:58AM +0900, Akira Yokosawa wrote:
>> >From 42dc2a0371d48c0b23f4ed70d556ef15213b5f69 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Thu, 19 May 2016 23:34:27 +0900
>> Subject: [PATCH] Improve messages regarding font installation
>>
>> In commit d8318d8db866 ("Add font installation check"), there was
>> typos already fixed by commit adc5a0ed9702 ("Fix typo "baloon" ->
>> "balloon"").
>> However, it breaks adjustment of "##" characters in the warning
>> messages.
>> This commit fixes them.
>> It also improves explanation of item 1 in FAQ-BUILD.txt by adding
>> a reference to item 1 of FAQ.txt.
>> It also adds a comment in Figure 1.1 that refers to item 1 in
>> FAQ.txt
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Queued, thank you!
> 
> BTW, I am still getting this:
> 
> #######################################################################
> ## Steel City Comic font is not found in the resulting PDF!          ##
> ## Some speech balloons in the cartoons have been rendered awkwardly.##
> ## See item 1 in FAQ-BUILD.txt for the solution.                     ##
> #######################################################################
> 
> I do have some fonts installed:
> 
> $ fc-list | grep steel
> /usr/share/fonts/truetype/steel-city-comic.regular.ttf: Steel City Comic:style=Regular,Normal,obyčejné,Standard,Κανονικά,Normaali,Normál,Normale,Standaard,Normalny,Обычный,Normálne,Navadno,Arrunta
> 
> This is from steel-city-comic.regular.ttf.  Is there something more that
> I need?  (I do plead much ignorance on fonts.)

I didn't expect you to hit this...

You mean the characters in Figures 3.1 and 3.2 don't fit in the balloons?

"make touchsvg; make" should help you, but I think you've already tried it.

"make neatfreak; make" will rebuild all the pdf files, but I don't expect
any difference in the result.

Could you send me "cartoons/r-2014-Old-man-and-Brat.pdf" off the list?

                                                    Thanks, Akira

> 
> 							Thanx, Paul
> 
>> ---
>>  FAQ-BUILD.txt         | 6 +++---
>>  howto/howto.tex       | 9 +++++----
>>  utilities/eps2pdf.sh  | 2 +-
>>  utilities/runlatex.sh | 2 +-
>>  4 files changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/FAQ-BUILD.txt b/FAQ-BUILD.txt
>> index d963534..e888725 100644
>> --- a/FAQ-BUILD.txt
>> +++ b/FAQ-BUILD.txt
>> @@ -1,6 +1,6 @@
>> -1.	I have installed the Steel City Comic font, and rebuilt
>> -	"perfbook.pdf".  But it doesn't seem to have any effect.
>> -	What am I missing?
>> +1.	I have installed the Steel City Comic font referring to item 1
>> +	in FAQ.txt, and rebuilt "perfbook.pdf". But it doesn't seem to
>> +	have any effect. What am I missing?
>>
>>  	A.	If you built "perfbook.pdf" before installing the font,
>>  		you need to rebuild cartoons whose sources are .svg
>> diff --git a/howto/howto.tex b/howto/howto.tex
>> index 6980114..7a70bb4 100644
>> --- a/howto/howto.tex
>> +++ b/howto/howto.tex
>> @@ -354,10 +354,11 @@ Other types of systems have well-known ways of locating files by filename.
>>  \begin{verbatim}
>>    1 git clone git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/perfbook.git
>>    2 cd perfbook
>> -  3 make
>> -  4 evince perfbook.pdf & # Two-column version
>> -  5 make perfbook-1c.pdf
>> -  6 evince perfbook-1c.pdf & # One-column version for e-readers
>> +  3 # You may need to install a font here. See item 1 in FAQ.txt.
>> +  4 make
>> +  5 evince perfbook.pdf & # Two-column version
>> +  6 make perfbook-1c.pdf
>> +  7 evince perfbook-1c.pdf & # One-column version for e-readers
>>  \end{verbatim}
>>  }
>>  \caption{Creating an Up-To-Date PDF}
>> diff --git a/utilities/eps2pdf.sh b/utilities/eps2pdf.sh
>> index 1497bdd..0a82d57 100644
>> --- a/utilities/eps2pdf.sh
>> +++ b/utilities/eps2pdf.sh
>> @@ -24,7 +24,7 @@ if ! fc-list | grep -q steel
>>  then
>>  	echo "#######################################################################"
>>  	echo "## Steel City Comic font is not found in the font cache!             ##"
>> -	echo "## Some speech balloons in the cartoons would be rendered awkwardly.  ##"
>> +	echo "## Some speech balloons in the cartoons would be rendered awkwardly. ##"
>>  	echo "## See item 1 in FAQ.txt for how to install the font.                ##"
>>  	echo "## Nevertheless, this build will resume in a short while.            ##"
>>  	echo "#######################################################################"
>> diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
>> index 9ae9021..94d46d6 100644
>> --- a/utilities/runlatex.sh
>> +++ b/utilities/runlatex.sh
>> @@ -117,7 +117,7 @@ if ! grep -q -i "steel city comic" cartoons/*.pdf
>>  then
>>  	echo "#######################################################################"
>>  	echo "## Steel City Comic font is not found in the resulting PDF!          ##"
>> -	echo "## Some speech balloons in the cartoons have been rendered awkwardly. ##"
>> +	echo "## Some speech balloons in the cartoons have been rendered awkwardly.##"
>>  	echo "## See item 1 in FAQ-BUILD.txt for the solution.                     ##"
>>  	echo "#######################################################################"
>>  fi
>> -- 
>> 1.9.1
>>
> 
> 

