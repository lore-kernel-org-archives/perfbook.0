Return-Path: <SRS0=OLMn=NZ=gmail.com=akiyks@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=870MoUFXPL0qphu7WjRGs0OVm6g0ilDU/QD5PxSnHwM=;
        b=YtdTHt18m+4mUd21inRSauO+JUko1+0U/dfRgAef/4RknPBlIRkUm9EpdMVzWHFl2T
         KtAZGJcyEvvooHR3j3FCRn6OrzkdE1G+Z1Khe6EPdW1NEyA5/0Vo+cMLWXKqqLVbWsn0
         DbO9SJAwTBaF9B9xEHaKp9Hl44Lvp/JsHdPPHP4/jghut7X9gHmBnkkO9Dy4Joe82k6g
         jo6ZxMS0Rc1DcWyOnthAC6vdiToBrZRgXMdYbLF9gRz2ovB1lSZsxpwuJGw4SPCMQs2R
         ejYICwa3GqShOos6WZzjARvZDYHBSx+j9yjB9E/MT8q+Tor0M1+B9drcroAb2jr1gixE
         TY8Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [Suggestion -perfbook] Abandon font embedding by gnuplot
Message-ID: <ad13ea5f-1c9e-2da8-5ca3-8abcaab99122@gmail.com>
Date: Fri, 3 Sep 2021 17:45:13 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Paul,

When I tried to run gnuplot under formal/data/ on a smallish Fedora
container image to test the update of Figure 12.10, it failed with
the error of:

    sh: line 1: pfbtops: command not found
             line 0: Command 'pfbtops /usr/share/texlive/texmf-dist/fonts/
.../uhvr8a.pfb' genereted error, exitcode is 32512

It turned out that I needed to install groff.  And gnuplot ran happily.

While I looked formal/data/plot.sh, if I removed the options:

    enhanced "NimbusSanL-Regu" fontfile "${font}"

in the first line of gnuplot instructions, gnuplot ran fine without
groff installed.

I think the fontfile option is for embedding font data into .eps
files.

Now we are doing .eps -> .pdf conversion via a2ping (or ghostscript),
so I don't think font embedding is necessary.

Furthermore, gnuplot's default of Helvetica font is overridden on-the-fly
by fixfonts.sh and its friends.

So there is no concern of embedding Helvetica font in the generated
pdf figures.

In the test on my side, generated pdf figures have the same font
properties regardless of the fontfile option.

So I'd like to ask you if it is ok to remove those fontfile options
in the plot scripts under CodeSamples/.
Removing them will reduce .eps file size and hopefully might reduce
time of (the lots of) .eps -> .pdf conversions.

Side note: plot.sh under formal/data should be moved under
CodeSamples/formal/ for the sake of consistency, I suppose.

        Thanks, Akira
