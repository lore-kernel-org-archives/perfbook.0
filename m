Return-Path: <SRS0=fT1V=ZD=foxmail.com=laokz@kernel.org>
Message-ID: <5dc940b4.1c69fb81.e45a9.e689SMTPIN_ADDED_BROKEN@mx.google.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1573470301;
	bh=sMAV9PxFJvCqR1xYXTPbKYzjYKdwZS6/QxbLYPvzhCc=;
	h=Message-ID:Subject:From:To:Date:MIME-Version;
	b=EhzzObDTC5BV+MaL1TsbdHwhO5nuI7WFmnPALj82beFzpWYf0fHFMCKTjC4Ms0M2Z
	 p3wmezpmj+6avvwGkyzBGneL9xKQUq3unc/lbYIRSbzTmHsxbo5AgHw4ULxRahCFnv
	 ATkFcoGqBkXXYRuVY/YASBegHmdXIICDGeEBtxaE=
Subject: Re: [PATCH] A little typos of perfbook
From: laokz <laokz@foxmail.com>
Date: Mon, 11 Nov 2019 19:04:57 +0800
In-Reply-To: <20191111035934.GI2865@paulmck-ThinkPad-P72>
References: <5dc51e76.1c69fb81.b298d.6c9aSMTPIN_ADDED_BROKEN@mx.google.com>
	 <20191111035934.GI2865@paulmck-ThinkPad-P72>
Content-Type: multipart/mixed; boundary="=-uBAi53t+CJ1a4QJiBpui"
MIME-Version: 1.0
To: paulmck@kernel.org
Cc: perfbook mailing list <perfbook@vger.kernel.org>
List-ID: <perfbook.vger.kernel.org>


--=-uBAi53t+CJ1a4QJiBpui
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hello Paul,

On Sun, Nov 10, 2019 at 19:59 -0800，Paul E. McKenney wrote：
> The patch did get corrupted by line breaks being inserted.  I fixed
> most of them, but it would be good to adjust your email agent to
> prevent this in the future.

Oh sorry, newbie always face with so many new issues;) 

> >  \QuickQuizAnswer{
> >  	The assertion must ensure that the load of
> >  	``e'' precedes that of ``a''.
> > -	In the Linux kernel, the \co{barrier()} primitive may be used to
> > +	In the Linux kernel, the \co{smp_rmb()} primitive may be used to
> >  	accomplish this in much the same way that the memory barrier was
> >  	used in the assertions in the previous examples.
> >  	For example, the assertion can be modified as follows:
> >  
> >  \begin{VerbatimU}[fontsize=\footnotesize]
> >  r1 = e;
> > -barrier();
> > +smp_rmb();
> >  assert(r1 == 0 || a == 1);
> >  \end{VerbatimU}
> 
> These two should stay barrier() because the communication is not with some
> other CPU, but rather with an interrupt handler running on the same CPU.
> So I left this diff hunk out.

Yeah, I forgot that interrupt always happen at exact in-order instruction.

> > diff --git a/defer/RCUListInsertClassic.svg b/defer/RCUListInsertClassic.svg
> > index f18a20e9..f93f4189 100644
> > --- a/defer/RCUListInsertClassic.svg
> > +++ b/defer/RCUListInsertClassic.svg
> > @@ -324,7 +324,7 @@
> >         id="text64"
> >         style="font-size:108px;font-style:normal;font-weight:bold;text-
> > anchor:middle;fill:#000000;font-family:Courier"><tspan
> >           style="font-size:108.53968048px;font-style:normal;font-
> > variant:normal;font-weight:bold;font-stretch:normal;font-family:Liberation
> > Mono;-inkscape-font-specification:Liberation Mono Bold"
> > -         id="tspan3836">gptr = smp_load_acquire(&amp;p);</tspan></text>
> > +         id="tspan3836">smp_store_release(&amp;gptr, p);</tspan></text>
> >      <!-- Text -->
> >      <!-- Text -->
> >      <!-- Text -->
> > 
> Good catch on all three of these, thank you!  (I had to do the patch to
> the figure by hand, though -- looks like some bad line breaks got inserted
> at some point.)

The newest perfbook tree shows that maybe my awkward patch tired you: smp_store_release(&amp;p, gptr) should be smp_store_release(&amp;gptr, p).

> > diff --git a/memorder/RCU2G2R.svg b/memorder/RCU2G2R.svg
> > index 124649e9..ac339491 100644
> > --- a/memorder/RCU2G2R.svg
> > +++ b/memorder/RCU2G2R.svg
> > @@ -823,7 +823,7 @@
> >             x="39.021881"
> >             y="793.81842"
> >             id="tspan4936-7"
> > -           style="text-align:start;text-anchor:start">WRITE_ONCE(x0,
> > 2);</tspan></text>
> > +           style="text-align:start;text-anchor:start">WRITE_ONCE(x1,
> > 2);</tspan></text>
> >      </g>
> >      <g
> >         transform="matrix(1.0007732,0,0,1.1198315,132.03049,64.767338)"
> > @@ -876,7 +876,7 @@
> >             id="tspan5356-1"
> >             y="792.81842"
> >             x="35.972801"
> > -           sodipodi:role="line">r2 = READ_ONCE(x1);</tspan></text>
> > +           sodipodi:role="line">r2 = READ_ONCE(x2);</tspan></text>
> >      </g>
> >      <text
> >         xml:space="preserve"
> 
> In this figure, each process writes one variable and reads the next.
> So P0() writes x0, then reads x1, P1() writes x1 and reads x2, and
> P2() writes x2 and reads x0.  This matches List 15.40.

This matches List 15.41 and Figure 15.14 - Two RCU Grace Periods and Two Readers. Original figure's P1() had wrong variables. By the way, P0's arrow to P1 was obscure, but I don't know how to fix.

> > diff --git a/memorder/store15tred.dot b/memorder/store15tred.dot
> > index ba6a277e..03a2f22c 100644
> > --- a/memorder/store15tred.dot
> > +++ b/memorder/store15tred.dot
> > @@ -1,5 +1,6 @@
> >  digraph sequence15CPUs {
> >  	1 -> 6;
> > +	2 -> 3;
> >  	2 -> 15;
> >  	3 -> 9;
> >  	4 -> 10;
> 
> There is a problem here, but the fix is to change "2 -> 15" to
> "2 -> 3", correct?

According to Figure 15.5, CPU2 had transient values 2 -> 3 -> 9, CPU6, 7 perceived 6(7) -> 2 -> 15 -> 9. Its relevant Figure 15.6 lost two arches.

I recommit the last three patches, wish them not too boring:) The attachment is the same patch file.


Best regards,
laokz

Signed-off-by: Zhang, Kai <laokz@foxmail.com>

-----------

diff --git a/defer/RCUListInsertClassic.svg b/defer/RCUListInsertClassic.svg
index 13f3c46d..cb0e060a 100644
--- a/defer/RCUListInsertClassic.svg
+++ b/defer/RCUListInsertClassic.svg
@@ -326,7 +326,7 @@
        id="text64"
        style="font-style:normal;font-weight:bold;font-size:108px;line-
height:0%;font-family:Courier;text-anchor:middle;fill:#000000"><tspan
          style="font-style:normal;font-variant:normal;font-
weight:bold;font-stretch:normal;font-size:108.53968048px;font-
family:'Liberation Mono';-inkscape-font-specification:'Liberation Mono
Bold'"
-         id="tspan3836">smp_store_release(&amp;p, gptr);</tspan></text>
+         id="tspan3836">smp_store_release(&amp;gptr, p);</tspan></text>
     <!-- Text -->
     <!-- Text -->
     <!-- Text -->
diff --git a/memorder/RCU2G2R.svg b/memorder/RCU2G2R.svg
index 124649e9..ac339491 100644
--- a/memorder/RCU2G2R.svg
+++ b/memorder/RCU2G2R.svg
@@ -823,7 +823,7 @@
            x="39.021881"
            y="793.81842"
            id="tspan4936-7"
-           style="text-align:start;text-anchor:start">WRITE_ONCE(x0,
2);</tspan></text>
+           style="text-align:start;text-anchor:start">WRITE_ONCE(x1,
2);</tspan></text>
     </g>
     <g
        transform="matrix(1.0007732,0,0,1.1198315,132.03049,64.767338)"
@@ -876,7 +876,7 @@
            id="tspan5356-1"
            y="792.81842"
            x="35.972801"
-           sodipodi:role="line">r2 = READ_ONCE(x1);</tspan></text>
+           sodipodi:role="line">r2 = READ_ONCE(x2);</tspan></text>
     </g>
     <text
        xml:space="preserve"
diff --git a/memorder/store15tred.dot b/memorder/store15tred.dot
index ba6a277e..1fc6f35b 100644
--- a/memorder/store15tred.dot
+++ b/memorder/store15tred.dot
@@ -1,5 +1,6 @@
 digraph sequence15CPUs {
 	1 -> 6;
+	2 -> 3;
 	2 -> 15;
 	3 -> 9;
 	4 -> 10;
@@ -14,5 +15,6 @@ digraph sequence15CPUs {
 	13 -> 12;
 	14 -> 15;
 	15 -> 12;
+	15 -> 9;
 	15 -> 3;
 }




--=-uBAi53t+CJ1a4QJiBpui
Content-Disposition: attachment; filename="a.diff"
Content-Type: text/x-patch; name="a.diff"; charset="UTF-8"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RlZmVyL1JDVUxpc3RJbnNlcnRDbGFzc2ljLnN2ZyBiL2RlZmVyL1JDVUxp
c3RJbnNlcnRDbGFzc2ljLnN2ZwppbmRleCAxM2YzYzQ2ZC4uY2IwZTA2MGEgMTAwNjQ0Ci0tLSBh
L2RlZmVyL1JDVUxpc3RJbnNlcnRDbGFzc2ljLnN2ZworKysgYi9kZWZlci9SQ1VMaXN0SW5zZXJ0
Q2xhc3NpYy5zdmcKQEAgLTMyNiw3ICszMjYsNyBAQAogICAgICAgIGlkPSJ0ZXh0NjQiCiAgICAg
ICAgc3R5bGU9ImZvbnQtc3R5bGU6bm9ybWFsO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1zaXplOjEw
OHB4O2xpbmUtaGVpZ2h0OjAlO2ZvbnQtZmFtaWx5OkNvdXJpZXI7dGV4dC1hbmNob3I6bWlkZGxl
O2ZpbGw6IzAwMDAwMCI+PHRzcGFuCiAgICAgICAgICBzdHlsZT0iZm9udC1zdHlsZTpub3JtYWw7
Zm9udC12YXJpYW50Om5vcm1hbDtmb250LXdlaWdodDpib2xkO2ZvbnQtc3RyZXRjaDpub3JtYWw7
Zm9udC1zaXplOjEwOC41Mzk2ODA0OHB4O2ZvbnQtZmFtaWx5OidMaWJlcmF0aW9uIE1vbm8nOy1p
bmtzY2FwZS1mb250LXNwZWNpZmljYXRpb246J0xpYmVyYXRpb24gTW9ubyBCb2xkJyIKLSAgICAg
ICAgIGlkPSJ0c3BhbjM4MzYiPnNtcF9zdG9yZV9yZWxlYXNlKCZhbXA7cCwgZ3B0cik7PC90c3Bh
bj48L3RleHQ+CisgICAgICAgICBpZD0idHNwYW4zODM2Ij5zbXBfc3RvcmVfcmVsZWFzZSgmYW1w
O2dwdHIsIHApOzwvdHNwYW4+PC90ZXh0PgogICAgIDwhLS0gVGV4dCAtLT4KICAgICA8IS0tIFRl
eHQgLS0+CiAgICAgPCEtLSBUZXh0IC0tPgpkaWZmIC0tZ2l0IGEvbWVtb3JkZXIvUkNVMkcyUi5z
dmcgYi9tZW1vcmRlci9SQ1UyRzJSLnN2ZwppbmRleCAxMjQ2NDllOS4uYWMzMzk0OTEgMTAwNjQ0
Ci0tLSBhL21lbW9yZGVyL1JDVTJHMlIuc3ZnCisrKyBiL21lbW9yZGVyL1JDVTJHMlIuc3ZnCkBA
IC04MjMsNyArODIzLDcgQEAKICAgICAgICAgICAgeD0iMzkuMDIxODgxIgogICAgICAgICAgICB5
PSI3OTMuODE4NDIiCiAgICAgICAgICAgIGlkPSJ0c3BhbjQ5MzYtNyIKLSAgICAgICAgICAgc3R5
bGU9InRleHQtYWxpZ246c3RhcnQ7dGV4dC1hbmNob3I6c3RhcnQiPldSSVRFX09OQ0UoeDAsIDIp
OzwvdHNwYW4+PC90ZXh0PgorICAgICAgICAgICBzdHlsZT0idGV4dC1hbGlnbjpzdGFydDt0ZXh0
LWFuY2hvcjpzdGFydCI+V1JJVEVfT05DRSh4MSwgMik7PC90c3Bhbj48L3RleHQ+CiAgICAgPC9n
PgogICAgIDxnCiAgICAgICAgdHJhbnNmb3JtPSJtYXRyaXgoMS4wMDA3NzMyLDAsMCwxLjExOTgz
MTUsMTMyLjAzMDQ5LDY0Ljc2NzMzOCkiCkBAIC04NzYsNyArODc2LDcgQEAKICAgICAgICAgICAg
aWQ9InRzcGFuNTM1Ni0xIgogICAgICAgICAgICB5PSI3OTIuODE4NDIiCiAgICAgICAgICAgIHg9
IjM1Ljk3MjgwMSIKLSAgICAgICAgICAgc29kaXBvZGk6cm9sZT0ibGluZSI+cjIgPSBSRUFEX09O
Q0UoeDEpOzwvdHNwYW4+PC90ZXh0PgorICAgICAgICAgICBzb2RpcG9kaTpyb2xlPSJsaW5lIj5y
MiA9IFJFQURfT05DRSh4Mik7PC90c3Bhbj48L3RleHQ+CiAgICAgPC9nPgogICAgIDx0ZXh0CiAg
ICAgICAgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIKZGlmZiAtLWdpdCBhL21lbW9yZGVyL3N0b3JlMTV0
cmVkLmRvdCBiL21lbW9yZGVyL3N0b3JlMTV0cmVkLmRvdAppbmRleCBiYTZhMjc3ZS4uMWZjNmYz
NWIgMTAwNjQ0Ci0tLSBhL21lbW9yZGVyL3N0b3JlMTV0cmVkLmRvdAorKysgYi9tZW1vcmRlci9z
dG9yZTE1dHJlZC5kb3QKQEAgLTEsNSArMSw2IEBACiBkaWdyYXBoIHNlcXVlbmNlMTVDUFVzIHsK
IAkxIC0+IDY7CisJMiAtPiAzOwogCTIgLT4gMTU7CiAJMyAtPiA5OwogCTQgLT4gMTA7CkBAIC0x
NCw1ICsxNSw2IEBAIGRpZ3JhcGggc2VxdWVuY2UxNUNQVXMgewogCTEzIC0+IDEyOwogCTE0IC0+
IDE1OwogCTE1IC0+IDEyOworCTE1IC0+IDk7CiAJMTUgLT4gMzsKIH0K


--=-uBAi53t+CJ1a4QJiBpui--



