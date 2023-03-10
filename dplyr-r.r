{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "1450cf91",
   "metadata": {
    "papermill": {
     "duration": 0.004965,
     "end_time": "2023-03-10T14:22:10.394456",
     "exception": false,
     "start_time": "2023-03-10T14:22:10.389491",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Wstep\n",
    "Pakiet dplyr (ogólnie pakiet tidyverse) to pakiet slużacy do sprawnej analizy i manipulacji danymi w jezyku R. \n",
    "Pozwala on na \"czyszczenie\" danych, wybieranie, grupowanie, laczenie i analizowanie co bardzo ulatwia nam prace na danych, potrzebnych nam w praktycznie kazdej czynnosci pracujac z R"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3e8bc3d7",
   "metadata": {
    "papermill": {
     "duration": 0.004132,
     "end_time": "2023-03-10T14:22:10.403056",
     "exception": false,
     "start_time": "2023-03-10T14:22:10.398924",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Instalowanie potrzebnych bibliotek"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "6c3f6c42",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:10.415896Z",
     "iopub.status.busy": "2023-03-10T14:22:10.413455Z",
     "iopub.status.idle": "2023-03-10T14:22:12.076198Z",
     "shell.execute_reply": "2023-03-10T14:22:12.074092Z"
    },
    "papermill": {
     "duration": 1.671704,
     "end_time": "2023-03-10T14:22:12.078775",
     "exception": false,
     "start_time": "2023-03-10T14:22:10.407071",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.4.0      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 1.0.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.5.0 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n"
     ]
    }
   ],
   "source": [
    "library(tidyverse)\n",
    "library(dplyr)\n",
    "library(ggplot2)\n",
    "library(tidyr)\n",
    "#library(SmarterPoland)\n",
    "#library(PogromcyDanych)\n",
    "#library(mylibrary)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7ce1d2a6",
   "metadata": {
    "papermill": {
     "duration": 0.004721,
     "end_time": "2023-03-10T14:22:12.088452",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.083731",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Pierwsze polecenia\n",
    "\n",
    "Zaladowanie danych"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "0d2a8629",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:12.135620Z",
     "iopub.status.busy": "2023-03-10T14:22:12.099475Z",
     "iopub.status.idle": "2023-03-10T14:22:12.149533Z",
     "shell.execute_reply": "2023-03-10T14:22:12.147689Z"
    },
    "papermill": {
     "duration": 0.058692,
     "end_time": "2023-03-10T14:22:12.151641",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.092949",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "pracownicy <- data.frame(\n",
    "                         Imie = c(\"Marek\", \"Jan\", \"Patryk\", \"Michal\", \"Ksawery\", \"Kamil\", \"Szymon\", \"Piotr\", \"Pawel\", \"Anna\"),\n",
    "                         Nazwisko = c(\"Marecki\", \"Janski\", \"Patrycki\", \"Michalski\", \"Ksawerski\", \"Kamilski\", \"Szymonski\", \"Piotrowski\", \"Piotrowski\", \"Piotrowska\"),\n",
    "                         Stanowisko = c(\"Data engineer\", \"Programist\", \"Administrator\", \"Programist\", \"Manager\", \"Administrator\", \"Data engineer\", \"Programist\", \"Administrator\", \"Tester\"),\n",
    "                         Wiek = c(25, 26, 21, 25, 22, 23, 26, 27, 30, 23),\n",
    "                         Miejscowosc = c(\"Krakow\", \"Warszawa\", \"Katowice\", \"Krakow\", \"Katowice\", \"Kielce\", \"Krakow\", \"Katowice\", \"Warszawa\", \"Kielce\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "86334af9",
   "metadata": {
    "papermill": {
     "duration": 0.004781,
     "end_time": "2023-03-10T14:22:12.161741",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.156960",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Pokazanie \"góry\" i \"dolu\" danych oraz summary"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "aad76fad",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:12.174360Z",
     "iopub.status.busy": "2023-03-10T14:22:12.172807Z",
     "iopub.status.idle": "2023-03-10T14:22:12.217904Z",
     "shell.execute_reply": "2023-03-10T14:22:12.216365Z"
    },
    "papermill": {
     "duration": 0.053347,
     "end_time": "2023-03-10T14:22:12.219763",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.166416",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Imie</th><th scope=col>Nazwisko</th><th scope=col>Stanowisko</th><th scope=col>Wiek</th><th scope=col>Miejscowosc</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>Marek  </td><td>Marecki  </td><td>Data engineer</td><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><th scope=row>2</th><td>Jan    </td><td>Janski   </td><td>Programist   </td><td>26</td><td>Warszawa</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>Patryk </td><td>Patrycki </td><td>Administrator</td><td>21</td><td>Katowice</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>Michal </td><td>Michalski</td><td>Programist   </td><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><th scope=row>5</th><td>Ksawery</td><td>Ksawerski</td><td>Manager      </td><td>22</td><td>Katowice</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>Kamil  </td><td>Kamilski </td><td>Administrator</td><td>23</td><td>Kielce  </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Imie & Nazwisko & Stanowisko & Wiek & Miejscowosc\\\\\n",
       "  & <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & Marek   & Marecki   & Data engineer & 25 & Krakow  \\\\\n",
       "\t2 & Jan     & Janski    & Programist    & 26 & Warszawa\\\\\n",
       "\t3 & Patryk  & Patrycki  & Administrator & 21 & Katowice\\\\\n",
       "\t4 & Michal  & Michalski & Programist    & 25 & Krakow  \\\\\n",
       "\t5 & Ksawery & Ksawerski & Manager       & 22 & Katowice\\\\\n",
       "\t6 & Kamil   & Kamilski  & Administrator & 23 & Kielce  \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 5\n",
       "\n",
       "| <!--/--> | Imie &lt;chr&gt; | Nazwisko &lt;chr&gt; | Stanowisko &lt;chr&gt; | Wiek &lt;dbl&gt; | Miejscowosc &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | Marek   | Marecki   | Data engineer | 25 | Krakow   |\n",
       "| 2 | Jan     | Janski    | Programist    | 26 | Warszawa |\n",
       "| 3 | Patryk  | Patrycki  | Administrator | 21 | Katowice |\n",
       "| 4 | Michal  | Michalski | Programist    | 25 | Krakow   |\n",
       "| 5 | Ksawery | Ksawerski | Manager       | 22 | Katowice |\n",
       "| 6 | Kamil   | Kamilski  | Administrator | 23 | Kielce   |\n",
       "\n"
      ],
      "text/plain": [
       "  Imie    Nazwisko  Stanowisko    Wiek Miejscowosc\n",
       "1 Marek   Marecki   Data engineer 25   Krakow     \n",
       "2 Jan     Janski    Programist    26   Warszawa   \n",
       "3 Patryk  Patrycki  Administrator 21   Katowice   \n",
       "4 Michal  Michalski Programist    25   Krakow     \n",
       "5 Ksawery Ksawerski Manager       22   Katowice   \n",
       "6 Kamil   Kamilski  Administrator 23   Kielce     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Imie</th><th scope=col>Nazwisko</th><th scope=col>Stanowisko</th><th scope=col>Wiek</th><th scope=col>Miejscowosc</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>5</th><td>Ksawery</td><td>Ksawerski </td><td>Manager      </td><td>22</td><td>Katowice</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>Kamil  </td><td>Kamilski  </td><td>Administrator</td><td>23</td><td>Kielce  </td></tr>\n",
       "\t<tr><th scope=row>7</th><td>Szymon </td><td>Szymonski </td><td>Data engineer</td><td>26</td><td>Krakow  </td></tr>\n",
       "\t<tr><th scope=row>8</th><td>Piotr  </td><td>Piotrowski</td><td>Programist   </td><td>27</td><td>Katowice</td></tr>\n",
       "\t<tr><th scope=row>9</th><td>Pawel  </td><td>Piotrowski</td><td>Administrator</td><td>30</td><td>Warszawa</td></tr>\n",
       "\t<tr><th scope=row>10</th><td>Anna   </td><td>Piotrowska</td><td>Tester       </td><td>23</td><td>Kielce  </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Imie & Nazwisko & Stanowisko & Wiek & Miejscowosc\\\\\n",
       "  & <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t5 & Ksawery & Ksawerski  & Manager       & 22 & Katowice\\\\\n",
       "\t6 & Kamil   & Kamilski   & Administrator & 23 & Kielce  \\\\\n",
       "\t7 & Szymon  & Szymonski  & Data engineer & 26 & Krakow  \\\\\n",
       "\t8 & Piotr   & Piotrowski & Programist    & 27 & Katowice\\\\\n",
       "\t9 & Pawel   & Piotrowski & Administrator & 30 & Warszawa\\\\\n",
       "\t10 & Anna    & Piotrowska & Tester        & 23 & Kielce  \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 5\n",
       "\n",
       "| <!--/--> | Imie &lt;chr&gt; | Nazwisko &lt;chr&gt; | Stanowisko &lt;chr&gt; | Wiek &lt;dbl&gt; | Miejscowosc &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 5 | Ksawery | Ksawerski  | Manager       | 22 | Katowice |\n",
       "| 6 | Kamil   | Kamilski   | Administrator | 23 | Kielce   |\n",
       "| 7 | Szymon  | Szymonski  | Data engineer | 26 | Krakow   |\n",
       "| 8 | Piotr   | Piotrowski | Programist    | 27 | Katowice |\n",
       "| 9 | Pawel   | Piotrowski | Administrator | 30 | Warszawa |\n",
       "| 10 | Anna    | Piotrowska | Tester        | 23 | Kielce   |\n",
       "\n"
      ],
      "text/plain": [
       "   Imie    Nazwisko   Stanowisko    Wiek Miejscowosc\n",
       "5  Ksawery Ksawerski  Manager       22   Katowice   \n",
       "6  Kamil   Kamilski   Administrator 23   Kielce     \n",
       "7  Szymon  Szymonski  Data engineer 26   Krakow     \n",
       "8  Piotr   Piotrowski Programist    27   Katowice   \n",
       "9  Pawel   Piotrowski Administrator 30   Warszawa   \n",
       "10 Anna    Piotrowska Tester        23   Kielce     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(pracownicy)\n",
    "tail(pracownicy)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "b842bd4d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:12.233417Z",
     "iopub.status.busy": "2023-03-10T14:22:12.231898Z",
     "iopub.status.idle": "2023-03-10T14:22:12.264835Z",
     "shell.execute_reply": "2023-03-10T14:22:12.263276Z"
    },
    "papermill": {
     "duration": 0.042962,
     "end_time": "2023-03-10T14:22:12.267761",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.224799",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "     Imie             Nazwisko          Stanowisko             Wiek     \n",
       " Length:10          Length:10          Length:10          Min.   :21.0  \n",
       " Class :character   Class :character   Class :character   1st Qu.:23.0  \n",
       " Mode  :character   Mode  :character   Mode  :character   Median :25.0  \n",
       "                                                          Mean   :24.8  \n",
       "                                                          3rd Qu.:26.0  \n",
       "                                                          Max.   :30.0  \n",
       " Miejscowosc       \n",
       " Length:10         \n",
       " Class :character  \n",
       " Mode  :character  \n",
       "                   \n",
       "                   \n",
       "                   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(pracownicy)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5cd40046",
   "metadata": {
    "papermill": {
     "duration": 0.004854,
     "end_time": "2023-03-10T14:22:12.277811",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.272957",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## FILTER\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "417fc8b9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:12.291329Z",
     "iopub.status.busy": "2023-03-10T14:22:12.289842Z",
     "iopub.status.idle": "2023-03-10T14:22:12.343851Z",
     "shell.execute_reply": "2023-03-10T14:22:12.341650Z"
    },
    "papermill": {
     "duration": 0.063655,
     "end_time": "2023-03-10T14:22:12.346539",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.282884",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 3 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Imie</th><th scope=col>Nazwisko</th><th scope=col>Stanowisko</th><th scope=col>Wiek</th><th scope=col>Miejscowosc</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Jan   </td><td>Janski    </td><td>Programist</td><td>26</td><td>Warszawa</td></tr>\n",
       "\t<tr><td>Michal</td><td>Michalski </td><td>Programist</td><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Piotr </td><td>Piotrowski</td><td>Programist</td><td>27</td><td>Katowice</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 3 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Imie & Nazwisko & Stanowisko & Wiek & Miejscowosc\\\\\n",
       " <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t Jan    & Janski     & Programist & 26 & Warszawa\\\\\n",
       "\t Michal & Michalski  & Programist & 25 & Krakow  \\\\\n",
       "\t Piotr  & Piotrowski & Programist & 27 & Katowice\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 3 × 5\n",
       "\n",
       "| Imie &lt;chr&gt; | Nazwisko &lt;chr&gt; | Stanowisko &lt;chr&gt; | Wiek &lt;dbl&gt; | Miejscowosc &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| Jan    | Janski     | Programist | 26 | Warszawa |\n",
       "| Michal | Michalski  | Programist | 25 | Krakow   |\n",
       "| Piotr  | Piotrowski | Programist | 27 | Katowice |\n",
       "\n"
      ],
      "text/plain": [
       "  Imie   Nazwisko   Stanowisko Wiek Miejscowosc\n",
       "1 Jan    Janski     Programist 26   Warszawa   \n",
       "2 Michal Michalski  Programist 25   Krakow     \n",
       "3 Piotr  Piotrowski Programist 27   Katowice   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pracownicy %>%\n",
    "  filter(Stanowisko == \"Programist\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2f880e3f",
   "metadata": {
    "papermill": {
     "duration": 0.005291,
     "end_time": "2023-03-10T14:22:12.357033",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.351742",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### Czym jest %>%?\n",
    "##### Jest to operator potoku, sluzy on do sekwencjonowania polecen, laczenia ze soba funkcji i latwiejszego wykonywania zlozonych badan na danych"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "41a2aee6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:12.371551Z",
     "iopub.status.busy": "2023-03-10T14:22:12.370108Z",
     "iopub.status.idle": "2023-03-10T14:22:12.402942Z",
     "shell.execute_reply": "2023-03-10T14:22:12.400917Z"
    },
    "papermill": {
     "duration": 0.044098,
     "end_time": "2023-03-10T14:22:12.406295",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.362197",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 2 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Imie</th><th scope=col>Nazwisko</th><th scope=col>Stanowisko</th><th scope=col>Wiek</th><th scope=col>Miejscowosc</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Marek </td><td>Marecki  </td><td>Data engineer</td><td>25</td><td>Krakow</td></tr>\n",
       "\t<tr><td>Szymon</td><td>Szymonski</td><td>Data engineer</td><td>26</td><td>Krakow</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 2 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Imie & Nazwisko & Stanowisko & Wiek & Miejscowosc\\\\\n",
       " <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t Marek  & Marecki   & Data engineer & 25 & Krakow\\\\\n",
       "\t Szymon & Szymonski & Data engineer & 26 & Krakow\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 2 × 5\n",
       "\n",
       "| Imie &lt;chr&gt; | Nazwisko &lt;chr&gt; | Stanowisko &lt;chr&gt; | Wiek &lt;dbl&gt; | Miejscowosc &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| Marek  | Marecki   | Data engineer | 25 | Krakow |\n",
       "| Szymon | Szymonski | Data engineer | 26 | Krakow |\n",
       "\n"
      ],
      "text/plain": [
       "  Imie   Nazwisko  Stanowisko    Wiek Miejscowosc\n",
       "1 Marek  Marecki   Data engineer 25   Krakow     \n",
       "2 Szymon Szymonski Data engineer 26   Krakow     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pracownicy %>%\n",
    "  filter(Miejscowosc == \"Krakow\") %>%\n",
    "  filter(Stanowisko == \"Data engineer\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "dc707d27",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:12.421839Z",
     "iopub.status.busy": "2023-03-10T14:22:12.420232Z",
     "iopub.status.idle": "2023-03-10T14:22:12.451843Z",
     "shell.execute_reply": "2023-03-10T14:22:12.449668Z"
    },
    "papermill": {
     "duration": 0.043334,
     "end_time": "2023-03-10T14:22:12.454992",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.411658",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Imie</th><th scope=col>Nazwisko</th><th scope=col>Stanowisko</th><th scope=col>Wiek</th><th scope=col>Miejscowosc</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Marek </td><td>Marecki   </td><td>Data engineer</td><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Jan   </td><td>Janski    </td><td>Programist   </td><td>26</td><td>Warszawa</td></tr>\n",
       "\t<tr><td>Michal</td><td>Michalski </td><td>Programist   </td><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Szymon</td><td>Szymonski </td><td>Data engineer</td><td>26</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Piotr </td><td>Piotrowski</td><td>Programist   </td><td>27</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Pawel </td><td>Piotrowski</td><td>Administrator</td><td>30</td><td>Warszawa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Imie & Nazwisko & Stanowisko & Wiek & Miejscowosc\\\\\n",
       " <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t Marek  & Marecki    & Data engineer & 25 & Krakow  \\\\\n",
       "\t Jan    & Janski     & Programist    & 26 & Warszawa\\\\\n",
       "\t Michal & Michalski  & Programist    & 25 & Krakow  \\\\\n",
       "\t Szymon & Szymonski  & Data engineer & 26 & Krakow  \\\\\n",
       "\t Piotr  & Piotrowski & Programist    & 27 & Katowice\\\\\n",
       "\t Pawel  & Piotrowski & Administrator & 30 & Warszawa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 5\n",
       "\n",
       "| Imie &lt;chr&gt; | Nazwisko &lt;chr&gt; | Stanowisko &lt;chr&gt; | Wiek &lt;dbl&gt; | Miejscowosc &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| Marek  | Marecki    | Data engineer | 25 | Krakow   |\n",
       "| Jan    | Janski     | Programist    | 26 | Warszawa |\n",
       "| Michal | Michalski  | Programist    | 25 | Krakow   |\n",
       "| Szymon | Szymonski  | Data engineer | 26 | Krakow   |\n",
       "| Piotr  | Piotrowski | Programist    | 27 | Katowice |\n",
       "| Pawel  | Piotrowski | Administrator | 30 | Warszawa |\n",
       "\n"
      ],
      "text/plain": [
       "  Imie   Nazwisko   Stanowisko    Wiek Miejscowosc\n",
       "1 Marek  Marecki    Data engineer 25   Krakow     \n",
       "2 Jan    Janski     Programist    26   Warszawa   \n",
       "3 Michal Michalski  Programist    25   Krakow     \n",
       "4 Szymon Szymonski  Data engineer 26   Krakow     \n",
       "5 Piotr  Piotrowski Programist    27   Katowice   \n",
       "6 Pawel  Piotrowski Administrator 30   Warszawa   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pracownicy %>%\n",
    "  filter(Wiek >= 25)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "91a8482c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:12.469551Z",
     "iopub.status.busy": "2023-03-10T14:22:12.467883Z",
     "iopub.status.idle": "2023-03-10T14:22:12.497645Z",
     "shell.execute_reply": "2023-03-10T14:22:12.495867Z"
    },
    "papermill": {
     "duration": 0.039917,
     "end_time": "2023-03-10T14:22:12.500487",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.460570",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 4 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Imie</th><th scope=col>Nazwisko</th><th scope=col>Stanowisko</th><th scope=col>Wiek</th><th scope=col>Miejscowosc</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Patryk </td><td>Patrycki  </td><td>Administrator</td><td>21</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Ksawery</td><td>Ksawerski </td><td>Manager      </td><td>22</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Kamil  </td><td>Kamilski  </td><td>Administrator</td><td>23</td><td>Kielce  </td></tr>\n",
       "\t<tr><td>Anna   </td><td>Piotrowska</td><td>Tester       </td><td>23</td><td>Kielce  </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 4 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Imie & Nazwisko & Stanowisko & Wiek & Miejscowosc\\\\\n",
       " <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t Patryk  & Patrycki   & Administrator & 21 & Katowice\\\\\n",
       "\t Ksawery & Ksawerski  & Manager       & 22 & Katowice\\\\\n",
       "\t Kamil   & Kamilski   & Administrator & 23 & Kielce  \\\\\n",
       "\t Anna    & Piotrowska & Tester        & 23 & Kielce  \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 4 × 5\n",
       "\n",
       "| Imie &lt;chr&gt; | Nazwisko &lt;chr&gt; | Stanowisko &lt;chr&gt; | Wiek &lt;dbl&gt; | Miejscowosc &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| Patryk  | Patrycki   | Administrator | 21 | Katowice |\n",
       "| Ksawery | Ksawerski  | Manager       | 22 | Katowice |\n",
       "| Kamil   | Kamilski   | Administrator | 23 | Kielce   |\n",
       "| Anna    | Piotrowska | Tester        | 23 | Kielce   |\n",
       "\n"
      ],
      "text/plain": [
       "  Imie    Nazwisko   Stanowisko    Wiek Miejscowosc\n",
       "1 Patryk  Patrycki   Administrator 21   Katowice   \n",
       "2 Ksawery Ksawerski  Manager       22   Katowice   \n",
       "3 Kamil   Kamilski   Administrator 23   Kielce     \n",
       "4 Anna    Piotrowska Tester        23   Kielce     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pracownicy %>%\n",
    "  filter(Wiek < 25)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "9a91c0c1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:12.515193Z",
     "iopub.status.busy": "2023-03-10T14:22:12.513709Z",
     "iopub.status.idle": "2023-03-10T14:22:12.543365Z",
     "shell.execute_reply": "2023-03-10T14:22:12.541764Z"
    },
    "papermill": {
     "duration": 0.039279,
     "end_time": "2023-03-10T14:22:12.545565",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.506286",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 7 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Imie</th><th scope=col>Nazwisko</th><th scope=col>Stanowisko</th><th scope=col>Wiek</th><th scope=col>Miejscowosc</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Jan    </td><td>Janski    </td><td>Programist   </td><td>26</td><td>Warszawa</td></tr>\n",
       "\t<tr><td>Patryk </td><td>Patrycki  </td><td>Administrator</td><td>21</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Ksawery</td><td>Ksawerski </td><td>Manager      </td><td>22</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Kamil  </td><td>Kamilski  </td><td>Administrator</td><td>23</td><td>Kielce  </td></tr>\n",
       "\t<tr><td>Piotr  </td><td>Piotrowski</td><td>Programist   </td><td>27</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Pawel  </td><td>Piotrowski</td><td>Administrator</td><td>30</td><td>Warszawa</td></tr>\n",
       "\t<tr><td>Anna   </td><td>Piotrowska</td><td>Tester       </td><td>23</td><td>Kielce  </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 7 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Imie & Nazwisko & Stanowisko & Wiek & Miejscowosc\\\\\n",
       " <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t Jan     & Janski     & Programist    & 26 & Warszawa\\\\\n",
       "\t Patryk  & Patrycki   & Administrator & 21 & Katowice\\\\\n",
       "\t Ksawery & Ksawerski  & Manager       & 22 & Katowice\\\\\n",
       "\t Kamil   & Kamilski   & Administrator & 23 & Kielce  \\\\\n",
       "\t Piotr   & Piotrowski & Programist    & 27 & Katowice\\\\\n",
       "\t Pawel   & Piotrowski & Administrator & 30 & Warszawa\\\\\n",
       "\t Anna    & Piotrowska & Tester        & 23 & Kielce  \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 7 × 5\n",
       "\n",
       "| Imie &lt;chr&gt; | Nazwisko &lt;chr&gt; | Stanowisko &lt;chr&gt; | Wiek &lt;dbl&gt; | Miejscowosc &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| Jan     | Janski     | Programist    | 26 | Warszawa |\n",
       "| Patryk  | Patrycki   | Administrator | 21 | Katowice |\n",
       "| Ksawery | Ksawerski  | Manager       | 22 | Katowice |\n",
       "| Kamil   | Kamilski   | Administrator | 23 | Kielce   |\n",
       "| Piotr   | Piotrowski | Programist    | 27 | Katowice |\n",
       "| Pawel   | Piotrowski | Administrator | 30 | Warszawa |\n",
       "| Anna    | Piotrowska | Tester        | 23 | Kielce   |\n",
       "\n"
      ],
      "text/plain": [
       "  Imie    Nazwisko   Stanowisko    Wiek Miejscowosc\n",
       "1 Jan     Janski     Programist    26   Warszawa   \n",
       "2 Patryk  Patrycki   Administrator 21   Katowice   \n",
       "3 Ksawery Ksawerski  Manager       22   Katowice   \n",
       "4 Kamil   Kamilski   Administrator 23   Kielce     \n",
       "5 Piotr   Piotrowski Programist    27   Katowice   \n",
       "6 Pawel   Piotrowski Administrator 30   Warszawa   \n",
       "7 Anna    Piotrowska Tester        23   Kielce     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pracownicy %>%\n",
    "  filter(Miejscowosc != \"Krakow\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "8d1c299e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:12.560496Z",
     "iopub.status.busy": "2023-03-10T14:22:12.559083Z",
     "iopub.status.idle": "2023-03-10T14:22:12.623658Z",
     "shell.execute_reply": "2023-03-10T14:22:12.622066Z"
    },
    "papermill": {
     "duration": 0.074476,
     "end_time": "2023-03-10T14:22:12.625781",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.551305",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Imie</th><th scope=col>Nazwisko</th><th scope=col>Stanowisko</th><th scope=col>Wiek</th><th scope=col>Miejscowosc</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Marek  </td><td>Marecki   </td><td>Data engineer</td><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Patryk </td><td>Patrycki  </td><td>Administrator</td><td>21</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Michal </td><td>Michalski </td><td>Programist   </td><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Ksawery</td><td>Ksawerski </td><td>Manager      </td><td>22</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Kamil  </td><td>Kamilski  </td><td>Administrator</td><td>23</td><td>Kielce  </td></tr>\n",
       "\t<tr><td>Anna   </td><td>Piotrowska</td><td>Tester       </td><td>23</td><td>Kielce  </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Imie & Nazwisko & Stanowisko & Wiek & Miejscowosc\\\\\n",
       " <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t Marek   & Marecki    & Data engineer & 25 & Krakow  \\\\\n",
       "\t Patryk  & Patrycki   & Administrator & 21 & Katowice\\\\\n",
       "\t Michal  & Michalski  & Programist    & 25 & Krakow  \\\\\n",
       "\t Ksawery & Ksawerski  & Manager       & 22 & Katowice\\\\\n",
       "\t Kamil   & Kamilski   & Administrator & 23 & Kielce  \\\\\n",
       "\t Anna    & Piotrowska & Tester        & 23 & Kielce  \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 5\n",
       "\n",
       "| Imie &lt;chr&gt; | Nazwisko &lt;chr&gt; | Stanowisko &lt;chr&gt; | Wiek &lt;dbl&gt; | Miejscowosc &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| Marek   | Marecki    | Data engineer | 25 | Krakow   |\n",
       "| Patryk  | Patrycki   | Administrator | 21 | Katowice |\n",
       "| Michal  | Michalski  | Programist    | 25 | Krakow   |\n",
       "| Ksawery | Ksawerski  | Manager       | 22 | Katowice |\n",
       "| Kamil   | Kamilski   | Administrator | 23 | Kielce   |\n",
       "| Anna    | Piotrowska | Tester        | 23 | Kielce   |\n",
       "\n"
      ],
      "text/plain": [
       "  Imie    Nazwisko   Stanowisko    Wiek Miejscowosc\n",
       "1 Marek   Marecki    Data engineer 25   Krakow     \n",
       "2 Patryk  Patrycki   Administrator 21   Katowice   \n",
       "3 Michal  Michalski  Programist    25   Krakow     \n",
       "4 Ksawery Ksawerski  Manager       22   Katowice   \n",
       "5 Kamil   Kamilski   Administrator 23   Kielce     \n",
       "6 Anna    Piotrowska Tester        23   Kielce     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pracownicy %>%\n",
    "  filter(between(Wiek,20,25))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "2b7e502c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:12.641468Z",
     "iopub.status.busy": "2023-03-10T14:22:12.639923Z",
     "iopub.status.idle": "2023-03-10T14:22:12.675602Z",
     "shell.execute_reply": "2023-03-10T14:22:12.673926Z"
    },
    "papermill": {
     "duration": 0.046349,
     "end_time": "2023-03-10T14:22:12.678313",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.631964",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Imie</th><th scope=col>Nazwisko</th><th scope=col>Stanowisko</th><th scope=col>Wiek</th><th scope=col>Miejscowosc</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Marek </td><td>Marecki   </td><td>Data engineer</td><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Jan   </td><td>Janski    </td><td>Programist   </td><td>26</td><td>Warszawa</td></tr>\n",
       "\t<tr><td>Michal</td><td>Michalski </td><td>Programist   </td><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Szymon</td><td>Szymonski </td><td>Data engineer</td><td>26</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Piotr </td><td>Piotrowski</td><td>Programist   </td><td>27</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Pawel </td><td>Piotrowski</td><td>Administrator</td><td>30</td><td>Warszawa</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Imie & Nazwisko & Stanowisko & Wiek & Miejscowosc\\\\\n",
       " <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t Marek  & Marecki    & Data engineer & 25 & Krakow  \\\\\n",
       "\t Jan    & Janski     & Programist    & 26 & Warszawa\\\\\n",
       "\t Michal & Michalski  & Programist    & 25 & Krakow  \\\\\n",
       "\t Szymon & Szymonski  & Data engineer & 26 & Krakow  \\\\\n",
       "\t Piotr  & Piotrowski & Programist    & 27 & Katowice\\\\\n",
       "\t Pawel  & Piotrowski & Administrator & 30 & Warszawa\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 5\n",
       "\n",
       "| Imie &lt;chr&gt; | Nazwisko &lt;chr&gt; | Stanowisko &lt;chr&gt; | Wiek &lt;dbl&gt; | Miejscowosc &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| Marek  | Marecki    | Data engineer | 25 | Krakow   |\n",
       "| Jan    | Janski     | Programist    | 26 | Warszawa |\n",
       "| Michal | Michalski  | Programist    | 25 | Krakow   |\n",
       "| Szymon | Szymonski  | Data engineer | 26 | Krakow   |\n",
       "| Piotr  | Piotrowski | Programist    | 27 | Katowice |\n",
       "| Pawel  | Piotrowski | Administrator | 30 | Warszawa |\n",
       "\n"
      ],
      "text/plain": [
       "  Imie   Nazwisko   Stanowisko    Wiek Miejscowosc\n",
       "1 Marek  Marecki    Data engineer 25   Krakow     \n",
       "2 Jan    Janski     Programist    26   Warszawa   \n",
       "3 Michal Michalski  Programist    25   Krakow     \n",
       "4 Szymon Szymonski  Data engineer 26   Krakow     \n",
       "5 Piotr  Piotrowski Programist    27   Katowice   \n",
       "6 Pawel  Piotrowski Administrator 30   Warszawa   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pracownicy %>% filter(Wiek > mean(Wiek, na.rm = TRUE))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e52c5b48",
   "metadata": {
    "papermill": {
     "duration": 0.006298,
     "end_time": "2023-03-10T14:22:12.691124",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.684826",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### SELECT"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "d70ebe57",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:12.707020Z",
     "iopub.status.busy": "2023-03-10T14:22:12.705510Z",
     "iopub.status.idle": "2023-03-10T14:22:12.810836Z",
     "shell.execute_reply": "2023-03-10T14:22:12.809053Z"
    },
    "papermill": {
     "duration": 0.11615,
     "end_time": "2023-03-10T14:22:12.813485",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.697335",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Imie</th><th scope=col>Nazwisko</th><th scope=col>Wiek</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Marek  </td><td>Marecki   </td><td>25</td></tr>\n",
       "\t<tr><td>Jan    </td><td>Janski    </td><td>26</td></tr>\n",
       "\t<tr><td>Patryk </td><td>Patrycki  </td><td>21</td></tr>\n",
       "\t<tr><td>Michal </td><td>Michalski </td><td>25</td></tr>\n",
       "\t<tr><td>Ksawery</td><td>Ksawerski </td><td>22</td></tr>\n",
       "\t<tr><td>Kamil  </td><td>Kamilski  </td><td>23</td></tr>\n",
       "\t<tr><td>Szymon </td><td>Szymonski </td><td>26</td></tr>\n",
       "\t<tr><td>Piotr  </td><td>Piotrowski</td><td>27</td></tr>\n",
       "\t<tr><td>Pawel  </td><td>Piotrowski</td><td>30</td></tr>\n",
       "\t<tr><td>Anna   </td><td>Piotrowska</td><td>23</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Imie & Nazwisko & Wiek\\\\\n",
       " <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Marek   & Marecki    & 25\\\\\n",
       "\t Jan     & Janski     & 26\\\\\n",
       "\t Patryk  & Patrycki   & 21\\\\\n",
       "\t Michal  & Michalski  & 25\\\\\n",
       "\t Ksawery & Ksawerski  & 22\\\\\n",
       "\t Kamil   & Kamilski   & 23\\\\\n",
       "\t Szymon  & Szymonski  & 26\\\\\n",
       "\t Piotr   & Piotrowski & 27\\\\\n",
       "\t Pawel   & Piotrowski & 30\\\\\n",
       "\t Anna    & Piotrowska & 23\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 3\n",
       "\n",
       "| Imie &lt;chr&gt; | Nazwisko &lt;chr&gt; | Wiek &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| Marek   | Marecki    | 25 |\n",
       "| Jan     | Janski     | 26 |\n",
       "| Patryk  | Patrycki   | 21 |\n",
       "| Michal  | Michalski  | 25 |\n",
       "| Ksawery | Ksawerski  | 22 |\n",
       "| Kamil   | Kamilski   | 23 |\n",
       "| Szymon  | Szymonski  | 26 |\n",
       "| Piotr   | Piotrowski | 27 |\n",
       "| Pawel   | Piotrowski | 30 |\n",
       "| Anna    | Piotrowska | 23 |\n",
       "\n"
      ],
      "text/plain": [
       "   Imie    Nazwisko   Wiek\n",
       "1  Marek   Marecki    25  \n",
       "2  Jan     Janski     26  \n",
       "3  Patryk  Patrycki   21  \n",
       "4  Michal  Michalski  25  \n",
       "5  Ksawery Ksawerski  22  \n",
       "6  Kamil   Kamilski   23  \n",
       "7  Szymon  Szymonski  26  \n",
       "8  Piotr   Piotrowski 27  \n",
       "9  Pawel   Piotrowski 30  \n",
       "10 Anna    Piotrowska 23  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Imie</th><th scope=col>Nazwisko</th><th scope=col>Stanowisko</th><th scope=col>Miejscowosc</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Marek  </td><td>Marecki   </td><td>Data engineer</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Jan    </td><td>Janski    </td><td>Programist   </td><td>Warszawa</td></tr>\n",
       "\t<tr><td>Patryk </td><td>Patrycki  </td><td>Administrator</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Michal </td><td>Michalski </td><td>Programist   </td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Ksawery</td><td>Ksawerski </td><td>Manager      </td><td>Katowice</td></tr>\n",
       "\t<tr><td>Kamil  </td><td>Kamilski  </td><td>Administrator</td><td>Kielce  </td></tr>\n",
       "\t<tr><td>Szymon </td><td>Szymonski </td><td>Data engineer</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Piotr  </td><td>Piotrowski</td><td>Programist   </td><td>Katowice</td></tr>\n",
       "\t<tr><td>Pawel  </td><td>Piotrowski</td><td>Administrator</td><td>Warszawa</td></tr>\n",
       "\t<tr><td>Anna   </td><td>Piotrowska</td><td>Tester       </td><td>Kielce  </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Imie & Nazwisko & Stanowisko & Miejscowosc\\\\\n",
       " <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t Marek   & Marecki    & Data engineer & Krakow  \\\\\n",
       "\t Jan     & Janski     & Programist    & Warszawa\\\\\n",
       "\t Patryk  & Patrycki   & Administrator & Katowice\\\\\n",
       "\t Michal  & Michalski  & Programist    & Krakow  \\\\\n",
       "\t Ksawery & Ksawerski  & Manager       & Katowice\\\\\n",
       "\t Kamil   & Kamilski   & Administrator & Kielce  \\\\\n",
       "\t Szymon  & Szymonski  & Data engineer & Krakow  \\\\\n",
       "\t Piotr   & Piotrowski & Programist    & Katowice\\\\\n",
       "\t Pawel   & Piotrowski & Administrator & Warszawa\\\\\n",
       "\t Anna    & Piotrowska & Tester        & Kielce  \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 4\n",
       "\n",
       "| Imie &lt;chr&gt; | Nazwisko &lt;chr&gt; | Stanowisko &lt;chr&gt; | Miejscowosc &lt;chr&gt; |\n",
       "|---|---|---|---|\n",
       "| Marek   | Marecki    | Data engineer | Krakow   |\n",
       "| Jan     | Janski     | Programist    | Warszawa |\n",
       "| Patryk  | Patrycki   | Administrator | Katowice |\n",
       "| Michal  | Michalski  | Programist    | Krakow   |\n",
       "| Ksawery | Ksawerski  | Manager       | Katowice |\n",
       "| Kamil   | Kamilski   | Administrator | Kielce   |\n",
       "| Szymon  | Szymonski  | Data engineer | Krakow   |\n",
       "| Piotr   | Piotrowski | Programist    | Katowice |\n",
       "| Pawel   | Piotrowski | Administrator | Warszawa |\n",
       "| Anna    | Piotrowska | Tester        | Kielce   |\n",
       "\n"
      ],
      "text/plain": [
       "   Imie    Nazwisko   Stanowisko    Miejscowosc\n",
       "1  Marek   Marecki    Data engineer Krakow     \n",
       "2  Jan     Janski     Programist    Warszawa   \n",
       "3  Patryk  Patrycki   Administrator Katowice   \n",
       "4  Michal  Michalski  Programist    Krakow     \n",
       "5  Ksawery Ksawerski  Manager       Katowice   \n",
       "6  Kamil   Kamilski   Administrator Kielce     \n",
       "7  Szymon  Szymonski  Data engineer Krakow     \n",
       "8  Piotr   Piotrowski Programist    Katowice   \n",
       "9  Pawel   Piotrowski Administrator Warszawa   \n",
       "10 Anna    Piotrowska Tester        Kielce     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Nazwisko</th><th scope=col>Stanowisko</th><th scope=col>Wiek</th><th scope=col>Miejscowosc</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Marecki   </td><td>Data engineer</td><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Janski    </td><td>Programist   </td><td>26</td><td>Warszawa</td></tr>\n",
       "\t<tr><td>Patrycki  </td><td>Administrator</td><td>21</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Michalski </td><td>Programist   </td><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Ksawerski </td><td>Manager      </td><td>22</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Kamilski  </td><td>Administrator</td><td>23</td><td>Kielce  </td></tr>\n",
       "\t<tr><td>Szymonski </td><td>Data engineer</td><td>26</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Piotrowski</td><td>Programist   </td><td>27</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Piotrowski</td><td>Administrator</td><td>30</td><td>Warszawa</td></tr>\n",
       "\t<tr><td>Piotrowska</td><td>Tester       </td><td>23</td><td>Kielce  </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 4\n",
       "\\begin{tabular}{llll}\n",
       " Nazwisko & Stanowisko & Wiek & Miejscowosc\\\\\n",
       " <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t Marecki    & Data engineer & 25 & Krakow  \\\\\n",
       "\t Janski     & Programist    & 26 & Warszawa\\\\\n",
       "\t Patrycki   & Administrator & 21 & Katowice\\\\\n",
       "\t Michalski  & Programist    & 25 & Krakow  \\\\\n",
       "\t Ksawerski  & Manager       & 22 & Katowice\\\\\n",
       "\t Kamilski   & Administrator & 23 & Kielce  \\\\\n",
       "\t Szymonski  & Data engineer & 26 & Krakow  \\\\\n",
       "\t Piotrowski & Programist    & 27 & Katowice\\\\\n",
       "\t Piotrowski & Administrator & 30 & Warszawa\\\\\n",
       "\t Piotrowska & Tester        & 23 & Kielce  \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 4\n",
       "\n",
       "| Nazwisko &lt;chr&gt; | Stanowisko &lt;chr&gt; | Wiek &lt;dbl&gt; | Miejscowosc &lt;chr&gt; |\n",
       "|---|---|---|---|\n",
       "| Marecki    | Data engineer | 25 | Krakow   |\n",
       "| Janski     | Programist    | 26 | Warszawa |\n",
       "| Patrycki   | Administrator | 21 | Katowice |\n",
       "| Michalski  | Programist    | 25 | Krakow   |\n",
       "| Ksawerski  | Manager       | 22 | Katowice |\n",
       "| Kamilski   | Administrator | 23 | Kielce   |\n",
       "| Szymonski  | Data engineer | 26 | Krakow   |\n",
       "| Piotrowski | Programist    | 27 | Katowice |\n",
       "| Piotrowski | Administrator | 30 | Warszawa |\n",
       "| Piotrowska | Tester        | 23 | Kielce   |\n",
       "\n"
      ],
      "text/plain": [
       "   Nazwisko   Stanowisko    Wiek Miejscowosc\n",
       "1  Marecki    Data engineer 25   Krakow     \n",
       "2  Janski     Programist    26   Warszawa   \n",
       "3  Patrycki   Administrator 21   Katowice   \n",
       "4  Michalski  Programist    25   Krakow     \n",
       "5  Ksawerski  Manager       22   Katowice   \n",
       "6  Kamilski   Administrator 23   Kielce     \n",
       "7  Szymonski  Data engineer 26   Krakow     \n",
       "8  Piotrowski Programist    27   Katowice   \n",
       "9  Piotrowski Administrator 30   Warszawa   \n",
       "10 Piotrowska Tester        23   Kielce     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pracownicy %>%\n",
    "  select(Imie, Nazwisko, Wiek)\n",
    "\n",
    "pracownicy %>%\n",
    "  select(-Wiek)\n",
    "\n",
    "pracownicy %>%\n",
    "  select(Nazwisko:Miejscowosc)\n",
    "\n",
    "#pracownicy %>%\n",
    "#select(where(is.character))\n",
    "\n",
    "#pracownicy %>%\n",
    "#  select(where(is.numeric))\n",
    "\n",
    "#pracownicy %>%\n",
    "#  select(!where(is.numeric))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "d8529aef",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:12.829877Z",
     "iopub.status.busy": "2023-03-10T14:22:12.828475Z",
     "iopub.status.idle": "2023-03-10T14:22:12.894484Z",
     "shell.execute_reply": "2023-03-10T14:22:12.892698Z"
    },
    "papermill": {
     "duration": 0.077062,
     "end_time": "2023-03-10T14:22:12.897307",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.820245",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Miejscowosc</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Krakow  </td></tr>\n",
       "\t<tr><td>Warszawa</td></tr>\n",
       "\t<tr><td>Katowice</td></tr>\n",
       "\t<tr><td>Krakow  </td></tr>\n",
       "\t<tr><td>Katowice</td></tr>\n",
       "\t<tr><td>Kielce  </td></tr>\n",
       "\t<tr><td>Krakow  </td></tr>\n",
       "\t<tr><td>Katowice</td></tr>\n",
       "\t<tr><td>Warszawa</td></tr>\n",
       "\t<tr><td>Kielce  </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 1\n",
       "\\begin{tabular}{l}\n",
       " Miejscowosc\\\\\n",
       " <chr>\\\\\n",
       "\\hline\n",
       "\t Krakow  \\\\\n",
       "\t Warszawa\\\\\n",
       "\t Katowice\\\\\n",
       "\t Krakow  \\\\\n",
       "\t Katowice\\\\\n",
       "\t Kielce  \\\\\n",
       "\t Krakow  \\\\\n",
       "\t Katowice\\\\\n",
       "\t Warszawa\\\\\n",
       "\t Kielce  \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 1\n",
       "\n",
       "| Miejscowosc &lt;chr&gt; |\n",
       "|---|\n",
       "| Krakow   |\n",
       "| Warszawa |\n",
       "| Katowice |\n",
       "| Krakow   |\n",
       "| Katowice |\n",
       "| Kielce   |\n",
       "| Krakow   |\n",
       "| Katowice |\n",
       "| Warszawa |\n",
       "| Kielce   |\n",
       "\n"
      ],
      "text/plain": [
       "   Miejscowosc\n",
       "1  Krakow     \n",
       "2  Warszawa   \n",
       "3  Katowice   \n",
       "4  Krakow     \n",
       "5  Katowice   \n",
       "6  Kielce     \n",
       "7  Krakow     \n",
       "8  Katowice   \n",
       "9  Warszawa   \n",
       "10 Kielce     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Nazwisko</th><th scope=col>Stanowisko</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Marecki   </td><td>Data engineer</td></tr>\n",
       "\t<tr><td>Janski    </td><td>Programist   </td></tr>\n",
       "\t<tr><td>Patrycki  </td><td>Administrator</td></tr>\n",
       "\t<tr><td>Michalski </td><td>Programist   </td></tr>\n",
       "\t<tr><td>Ksawerski </td><td>Manager      </td></tr>\n",
       "\t<tr><td>Kamilski  </td><td>Administrator</td></tr>\n",
       "\t<tr><td>Szymonski </td><td>Data engineer</td></tr>\n",
       "\t<tr><td>Piotrowski</td><td>Programist   </td></tr>\n",
       "\t<tr><td>Piotrowski</td><td>Administrator</td></tr>\n",
       "\t<tr><td>Piotrowska</td><td>Tester       </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 2\n",
       "\\begin{tabular}{ll}\n",
       " Nazwisko & Stanowisko\\\\\n",
       " <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t Marecki    & Data engineer\\\\\n",
       "\t Janski     & Programist   \\\\\n",
       "\t Patrycki   & Administrator\\\\\n",
       "\t Michalski  & Programist   \\\\\n",
       "\t Ksawerski  & Manager      \\\\\n",
       "\t Kamilski   & Administrator\\\\\n",
       "\t Szymonski  & Data engineer\\\\\n",
       "\t Piotrowski & Programist   \\\\\n",
       "\t Piotrowski & Administrator\\\\\n",
       "\t Piotrowska & Tester       \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 2\n",
       "\n",
       "| Nazwisko &lt;chr&gt; | Stanowisko &lt;chr&gt; |\n",
       "|---|---|\n",
       "| Marecki    | Data engineer |\n",
       "| Janski     | Programist    |\n",
       "| Patrycki   | Administrator |\n",
       "| Michalski  | Programist    |\n",
       "| Ksawerski  | Manager       |\n",
       "| Kamilski   | Administrator |\n",
       "| Szymonski  | Data engineer |\n",
       "| Piotrowski | Programist    |\n",
       "| Piotrowski | Administrator |\n",
       "| Piotrowska | Tester        |\n",
       "\n"
      ],
      "text/plain": [
       "   Nazwisko   Stanowisko   \n",
       "1  Marecki    Data engineer\n",
       "2  Janski     Programist   \n",
       "3  Patrycki   Administrator\n",
       "4  Michalski  Programist   \n",
       "5  Ksawerski  Manager      \n",
       "6  Kamilski   Administrator\n",
       "7  Szymonski  Data engineer\n",
       "8  Piotrowski Programist   \n",
       "9  Piotrowski Administrator\n",
       "10 Piotrowska Tester       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Wiek</th><th scope=col>Miejscowosc</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>26</td><td>Warszawa</td></tr>\n",
       "\t<tr><td>21</td><td>Katowice</td></tr>\n",
       "\t<tr><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>22</td><td>Katowice</td></tr>\n",
       "\t<tr><td>23</td><td>Kielce  </td></tr>\n",
       "\t<tr><td>26</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>27</td><td>Katowice</td></tr>\n",
       "\t<tr><td>30</td><td>Warszawa</td></tr>\n",
       "\t<tr><td>23</td><td>Kielce  </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 2\n",
       "\\begin{tabular}{ll}\n",
       " Wiek & Miejscowosc\\\\\n",
       " <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t 25 & Krakow  \\\\\n",
       "\t 26 & Warszawa\\\\\n",
       "\t 21 & Katowice\\\\\n",
       "\t 25 & Krakow  \\\\\n",
       "\t 22 & Katowice\\\\\n",
       "\t 23 & Kielce  \\\\\n",
       "\t 26 & Krakow  \\\\\n",
       "\t 27 & Katowice\\\\\n",
       "\t 30 & Warszawa\\\\\n",
       "\t 23 & Kielce  \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 2\n",
       "\n",
       "| Wiek &lt;dbl&gt; | Miejscowosc &lt;chr&gt; |\n",
       "|---|---|\n",
       "| 25 | Krakow   |\n",
       "| 26 | Warszawa |\n",
       "| 21 | Katowice |\n",
       "| 25 | Krakow   |\n",
       "| 22 | Katowice |\n",
       "| 23 | Kielce   |\n",
       "| 26 | Krakow   |\n",
       "| 27 | Katowice |\n",
       "| 30 | Warszawa |\n",
       "| 23 | Kielce   |\n",
       "\n"
      ],
      "text/plain": [
       "   Wiek Miejscowosc\n",
       "1  25   Krakow     \n",
       "2  26   Warszawa   \n",
       "3  21   Katowice   \n",
       "4  25   Krakow     \n",
       "5  22   Katowice   \n",
       "6  23   Kielce     \n",
       "7  26   Krakow     \n",
       "8  27   Katowice   \n",
       "9  30   Warszawa   \n",
       "10 23   Kielce     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pracownicy %>%\n",
    "  select(starts_with(\"M\"))\n",
    "\n",
    "pracownicy %>%\n",
    "  select(ends_with(\"o\"))\n",
    "\n",
    "pracownicy %>%\n",
    "  select(matches(\".e.\"))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "44d3b625",
   "metadata": {
    "papermill": {
     "duration": 0.007183,
     "end_time": "2023-03-10T14:22:12.912624",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.905441",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### RENAME \n",
    "Możemy zmieniac nazwy kolumn i pracowac na nowych danych"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "4f48df7a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:12.929798Z",
     "iopub.status.busy": "2023-03-10T14:22:12.928372Z",
     "iopub.status.idle": "2023-03-10T14:22:12.960859Z",
     "shell.execute_reply": "2023-03-10T14:22:12.959095Z"
    },
    "papermill": {
     "duration": 0.043772,
     "end_time": "2023-03-10T14:22:12.963397",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.919625",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 10 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Imie</th><th scope=col>Nazwisko</th><th scope=col>Stanowisko</th><th scope=col>Wiek</th><th scope=col>Miejsce_zamieszkania</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Marek  </td><td>Marecki   </td><td>Data engineer</td><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Jan    </td><td>Janski    </td><td>Programist   </td><td>26</td><td>Warszawa</td></tr>\n",
       "\t<tr><td>Patryk </td><td>Patrycki  </td><td>Administrator</td><td>21</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Michal </td><td>Michalski </td><td>Programist   </td><td>25</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Ksawery</td><td>Ksawerski </td><td>Manager      </td><td>22</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Kamil  </td><td>Kamilski  </td><td>Administrator</td><td>23</td><td>Kielce  </td></tr>\n",
       "\t<tr><td>Szymon </td><td>Szymonski </td><td>Data engineer</td><td>26</td><td>Krakow  </td></tr>\n",
       "\t<tr><td>Piotr  </td><td>Piotrowski</td><td>Programist   </td><td>27</td><td>Katowice</td></tr>\n",
       "\t<tr><td>Pawel  </td><td>Piotrowski</td><td>Administrator</td><td>30</td><td>Warszawa</td></tr>\n",
       "\t<tr><td>Anna   </td><td>Piotrowska</td><td>Tester       </td><td>23</td><td>Kielce  </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 10 × 5\n",
       "\\begin{tabular}{lllll}\n",
       " Imie & Nazwisko & Stanowisko & Wiek & Miejsce\\_zamieszkania\\\\\n",
       " <chr> & <chr> & <chr> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t Marek   & Marecki    & Data engineer & 25 & Krakow  \\\\\n",
       "\t Jan     & Janski     & Programist    & 26 & Warszawa\\\\\n",
       "\t Patryk  & Patrycki   & Administrator & 21 & Katowice\\\\\n",
       "\t Michal  & Michalski  & Programist    & 25 & Krakow  \\\\\n",
       "\t Ksawery & Ksawerski  & Manager       & 22 & Katowice\\\\\n",
       "\t Kamil   & Kamilski   & Administrator & 23 & Kielce  \\\\\n",
       "\t Szymon  & Szymonski  & Data engineer & 26 & Krakow  \\\\\n",
       "\t Piotr   & Piotrowski & Programist    & 27 & Katowice\\\\\n",
       "\t Pawel   & Piotrowski & Administrator & 30 & Warszawa\\\\\n",
       "\t Anna    & Piotrowska & Tester        & 23 & Kielce  \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 10 × 5\n",
       "\n",
       "| Imie &lt;chr&gt; | Nazwisko &lt;chr&gt; | Stanowisko &lt;chr&gt; | Wiek &lt;dbl&gt; | Miejsce_zamieszkania &lt;chr&gt; |\n",
       "|---|---|---|---|---|\n",
       "| Marek   | Marecki    | Data engineer | 25 | Krakow   |\n",
       "| Jan     | Janski     | Programist    | 26 | Warszawa |\n",
       "| Patryk  | Patrycki   | Administrator | 21 | Katowice |\n",
       "| Michal  | Michalski  | Programist    | 25 | Krakow   |\n",
       "| Ksawery | Ksawerski  | Manager       | 22 | Katowice |\n",
       "| Kamil   | Kamilski   | Administrator | 23 | Kielce   |\n",
       "| Szymon  | Szymonski  | Data engineer | 26 | Krakow   |\n",
       "| Piotr   | Piotrowski | Programist    | 27 | Katowice |\n",
       "| Pawel   | Piotrowski | Administrator | 30 | Warszawa |\n",
       "| Anna    | Piotrowska | Tester        | 23 | Kielce   |\n",
       "\n"
      ],
      "text/plain": [
       "   Imie    Nazwisko   Stanowisko    Wiek Miejsce_zamieszkania\n",
       "1  Marek   Marecki    Data engineer 25   Krakow              \n",
       "2  Jan     Janski     Programist    26   Warszawa            \n",
       "3  Patryk  Patrycki   Administrator 21   Katowice            \n",
       "4  Michal  Michalski  Programist    25   Krakow              \n",
       "5  Ksawery Ksawerski  Manager       22   Katowice            \n",
       "6  Kamil   Kamilski   Administrator 23   Kielce              \n",
       "7  Szymon  Szymonski  Data engineer 26   Krakow              \n",
       "8  Piotr   Piotrowski Programist    27   Katowice            \n",
       "9  Pawel   Piotrowski Administrator 30   Warszawa            \n",
       "10 Anna    Piotrowska Tester        23   Kielce              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "change <- pracownicy %>% rename(Miejsce_zamieszkania = Miejscowosc)\n",
    "change"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "37c36e8c",
   "metadata": {
    "papermill": {
     "duration": 0.008219,
     "end_time": "2023-03-10T14:22:12.979152",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.970933",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### SEPARATE"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "53470100",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-03-10T14:22:12.997185Z",
     "iopub.status.busy": "2023-03-10T14:22:12.995765Z",
     "iopub.status.idle": "2023-03-10T14:22:13.039618Z",
     "shell.execute_reply": "2023-03-10T14:22:13.037282Z"
    },
    "papermill": {
     "duration": 0.055935,
     "end_time": "2023-03-10T14:22:13.042555",
     "exception": false,
     "start_time": "2023-03-10T14:22:12.986620",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 1</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>data</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>01/01/2020</td></tr>\n",
       "\t<tr><td>02/02/2020</td></tr>\n",
       "\t<tr><td>03/03/2020</td></tr>\n",
       "\t<tr><td>04/04/2020</td></tr>\n",
       "\t<tr><td>05/05/2020</td></tr>\n",
       "\t<tr><td>06/06/2020</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 1\n",
       "\\begin{tabular}{l}\n",
       " data\\\\\n",
       " <chr>\\\\\n",
       "\\hline\n",
       "\t 01/01/2020\\\\\n",
       "\t 02/02/2020\\\\\n",
       "\t 03/03/2020\\\\\n",
       "\t 04/04/2020\\\\\n",
       "\t 05/05/2020\\\\\n",
       "\t 06/06/2020\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 1\n",
       "\n",
       "| data &lt;chr&gt; |\n",
       "|---|\n",
       "| 01/01/2020 |\n",
       "| 02/02/2020 |\n",
       "| 03/03/2020 |\n",
       "| 04/04/2020 |\n",
       "| 05/05/2020 |\n",
       "| 06/06/2020 |\n",
       "\n"
      ],
      "text/plain": [
       "  data      \n",
       "1 01/01/2020\n",
       "2 02/02/2020\n",
       "3 03/03/2020\n",
       "4 04/04/2020\n",
       "5 05/05/2020\n",
       "6 06/06/2020"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Dzien</th><th scope=col>Miesiac</th><th scope=col>Rok</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>01</td><td>01</td><td>2020</td></tr>\n",
       "\t<tr><td>02</td><td>02</td><td>2020</td></tr>\n",
       "\t<tr><td>03</td><td>03</td><td>2020</td></tr>\n",
       "\t<tr><td>04</td><td>04</td><td>2020</td></tr>\n",
       "\t<tr><td>05</td><td>05</td><td>2020</td></tr>\n",
       "\t<tr><td>06</td><td>06</td><td>2020</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 3\n",
       "\\begin{tabular}{lll}\n",
       " Dzien & Miesiac & Rok\\\\\n",
       " <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t 01 & 01 & 2020\\\\\n",
       "\t 02 & 02 & 2020\\\\\n",
       "\t 03 & 03 & 2020\\\\\n",
       "\t 04 & 04 & 2020\\\\\n",
       "\t 05 & 05 & 2020\\\\\n",
       "\t 06 & 06 & 2020\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 3\n",
       "\n",
       "| Dzien &lt;chr&gt; | Miesiac &lt;chr&gt; | Rok &lt;chr&gt; |\n",
       "|---|---|---|\n",
       "| 01 | 01 | 2020 |\n",
       "| 02 | 02 | 2020 |\n",
       "| 03 | 03 | 2020 |\n",
       "| 04 | 04 | 2020 |\n",
       "| 05 | 05 | 2020 |\n",
       "| 06 | 06 | 2020 |\n",
       "\n"
      ],
      "text/plain": [
       "  Dzien Miesiac Rok \n",
       "1 01    01      2020\n",
       "2 02    02      2020\n",
       "3 03    03      2020\n",
       "4 04    04      2020\n",
       "5 05    05      2020\n",
       "6 06    06      2020"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "\n",
    "\n",
    "zmiana <- data.frame(data = c(\"01/01/2020\",\n",
    "                              \"02/02/2020\",\n",
    "                              \"03/03/2020\",\n",
    "                              \"04/04/2020\",\n",
    "                              \"05/05/2020\",\n",
    "                              \"06/06/2020\"))\n",
    "zmiana\n",
    "  \n",
    "zmiana %>% separate(data, c(\"Dzien\", \"Miesiac\", \"Rok\"), sep=\"/\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "d4aef21a",
   "metadata": {
    "papermill": {
     "duration": 0.007464,
     "end_time": "2023-03-10T14:22:13.057659",
     "exception": false,
     "start_time": "2023-03-10T14:22:13.050195",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 6.707902,
   "end_time": "2023-03-10T14:22:13.188121",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-03-10T14:22:06.480219",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
