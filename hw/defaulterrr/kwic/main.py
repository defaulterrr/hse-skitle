from typing import List, MutableSet
from concord import read_concords
from kwic import KWICSharedSolver

import logging

import click

@click.command()
@click.option("--input", default="", help="input file to be read")
@click.option("--keywords", default=(), help="words to be used as keywords in kwic implementation")
@click.option("--stopwords", default=(), help="stopwords for kwic implementation")
@click.option("--verbose", default=False, help="enable verbose logging", is_flag=True)
def main(input: str, keywords: MutableSet[str], stopwords: MutableSet[str], verbose: bool):
    # Python shit-style init for sets
    kws: MutableSet[str] = set(keywords) if keywords != "()" else set()
    sws: MutableSet[str] = set(stopwords) if stopwords != "()" else set()

    if verbose:
        logging.basicConfig(level=logging.DEBUG)
    else:
        logging.basicConfig(level=logging.INFO)
    logging.debug("reading from: {}".format(input))
    logging.debug("initial keywords: {}".format(keywords))
    logging.debug("initial stopwords: {}".format(stopwords))

    with open(input) as inp_source:
        solver = KWICSharedSolver(inp_source.readlines(), kws, sws)

        res = solver.solve()
        for r in res:
            print(r.to_string())
            # print(r.to_string_centered())

    return 

if __name__ == "__main__":
    main()